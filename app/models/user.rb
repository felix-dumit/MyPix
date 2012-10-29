# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)
#  date_of_birth   :date
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string(255)
#  remember_token  :string(255)
#

class User < ActiveRecord::Base
    extend FriendlyId
    friendly_id :name

    attr_accessible :name, :email, :password, :password_confirmation

    has_secure_password
    has_many :images, dependent: :destroy
    has_many :friendships
    has_many :friends, :through => :friendships
    has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
    has_many :inverse_friends, :through => :inverse_friendships, :source => :user

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    VALID_USERNAME_REGEX = /^[a-zA-Z0-9][a-zA-Z0-9_.-]*$/
    validates :name, presence: true, uniqueness: true, length: { maximum:20 },  format: { with: VALID_USERNAME_REGEX }
    validates :email, presence: true, uniqueness: { case_sensitive: false },  format: { with: VALID_EMAIL_REGEX }

    before_save { |user| user.email = email.downcase }
    before_save :create_remember_token

    validates :password, presence: true, length: { minimum: 6 }
    validates :password_confirmation, presence: true

    private
    def create_remember_token
        self.remember_token = SecureRandom.urlsafe_base64
    end



end
