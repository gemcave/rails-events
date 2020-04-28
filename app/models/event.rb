class Event < ApplicationRecord
	validates :slug, uniqueness: true
	validates :name, presence: true, uniqueness: true
	validates :location, presence: true
	validates :description, length: {minimum: 25}
	validates :price, numericality: {greater_than_or_equal_to: 0}
	validates :capacity, numericality: {only_integer: true, greater_than: 0}
	
	has_one_attached :main_image
	
	# has_one :main_image_attachment, dependent: :destroy
	# has_one :main_image_blob, through: :main_image_attachment
	
	before_validation :generate_slug
	
	has_many :registrations, dependent: :destroy
	has_many :likes, dependent: :destroy
	has_many :likers, through: :likes, source: :user
	has_many :categorizations, dependent: :destroy
	has_many :categories, through: :categorizations

	has_rich_text :description

	def free?
		price.blank? || price.zero?
	end
	
	validate :acceptable_image 

	scope :past, -> {where("starts_at < ?", Time.now).order("starts_at")}
	scope :upcoming, -> {where("starts_at >= ?", Time.now).order("starts_at")}
	scope :free, -> {upcoming.where(price: 0).order(:name)}
	scope :recent, -> (max=3) {past.limit(max)}

	# def self.past
	# 	where("starts_at < ?", Time.now).order("starts_at")
	# end

	# def self.upcoming
	# 	where("starts_at >= ?", Time.now).order("starts_at")
	# end

	def spots_left
		capacity - registrations.size
	end

	def sold_out?
		spots_left.zero?
	end

	def to_param
		slug
	end

	def generate_slug
		self.slug ||= name.parameterize if name
	end
	private
	def acceptable_image
		return unless main_image.attached?
		
		unless main_image.blob.byte_size <= 1.megabyte
			errors.add(:main_image, "is too big")
		end

		acceptable_types = ["image/jpeg", "image/png"]
		unless acceptable_types.include?(main_image.content_type)
			errors.add(:main_image, "must be a JPEG or PNG")
		end
	end
end

