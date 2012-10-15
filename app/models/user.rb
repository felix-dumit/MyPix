# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)
#  username        :string(255)
#  date_of_birth   :date
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string(255)
#

class User < ActiveRecord::Base
    attr_accessible :name, :email, :password, :password_confirmation

    has_secure_password

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    VALID_USERNAME_REGEX = /^[a-zA-Z0-9][a-zA-Z0-9_]*$/
    validates :name, presence: true, length: { maximum: 50 },  format: { with: VALID_USERNAME_REGEX }
    validates :email, presence: true, uniqueness: { case_sensitive: false },  format: { with: VALID_EMAIL_REGEX }

    before_save { |user| user.email = email.downcase }

    validates :password, presence: true, length: { minimum: 6 }
    validates :password_confirmation, presence: true

end
