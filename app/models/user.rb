class User < ApplicationRecord
	has_secure_password
	has_many :registrations, dependent: :destroy
	has_many :likes, dependent: :destroy
	has_many :liked_events, through: :likes, source: :event

	validates :name, presence: true
	validates :email, presence: true,
										format: /\A\S+@\S+\z/,
										uniqueness: { case_sensitive: false}
	
	def self.authenticate(email, password)
		user = User.find_by(email: email)
		user && user.authenticate(password)
	end
end
 