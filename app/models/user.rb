# == Schema Information
#
# Table name: users
#
#  id            :integer          not null, primary key
#  name          :string(255)
#  email         :string(255)
#  username      :string(255)
#  date_of_birth :date
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class User < ActiveRecord::Base
    attr_accessible :name, :email, :username

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    VALID_USERNAME_REGEX = /^[a-zA-Z0-9][a-zA-Z0-9_]*$/
    validates :name, presence: true, length: { maximum: 50 }
    validates :email, presence: true, uniqueness: { case_sensitive: false },  format: { with: VALID_EMAIL_REGEX }
    validates :username, presence: true, uniqueness: true,  format: { with: VALID_USERNAME_REGEX }

    before_save { |user| user.email = email.downcase }

end
