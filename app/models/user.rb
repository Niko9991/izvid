class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy
  has_many :suppliers
  normalizes :email_address, with: ->(e) { e.strip.downcase }
  has_many :papers, through: :suppliers
end
