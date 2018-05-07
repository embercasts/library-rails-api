require 'bcrypt'

class User < ApplicationRecord
  attr_reader :password
  attr_accessor :password_confirmation

  def password=(unencrypted_password)
    @password = unencrypted_password
    self.password_digest = BCrypt::Password.create(unencrypted_password)
  end

  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true, confirmation: true
  validates :password_confirmation, presence: true
end
