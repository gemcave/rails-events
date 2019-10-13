class User < ApplicationRecord
	validates :name, presence: true
	validates :email, presence: true,
										format: /\A\S+@\S+\z/,
										uniqueness: { case_sensitive: false}
  has_secure_password
end
