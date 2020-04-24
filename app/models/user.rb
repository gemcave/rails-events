class User < ApplicationRecord
	has_secure_password
	has_many :registrations, dependent: :destroy
	has_many :likes, dependent: :destroy
	has_many :liked_events, through: :likes, source: :event

	validates :name, presence: true
	validates :email, presence: true,
										format: /\A\S+@\S+\z/,
										uniqueness: { case_sensitive: false}
	
	# before_create { generate_token(:auth_token) }

	def self.authenticate(email, password)
		user = User.find_by(email: email)
		user && user.authenticate(password)
	end

	def send_password_reset 
		generate_token(:reset_password_token)
		self.reset_password_sent_at = Time.zone.now 
		save!
		UserMailer.password_reset(self).deliver 
	end 

	def generate_token(column)
			begin 
					self[column] = SecureRandom.urlsafe_base64
			end while User.exists?(column => self[column])
	end 									
end
 