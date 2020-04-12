module EventsHelper
	def format_price(event)
		if event.free?
			content_tag(:strong, t('common.free'))
		elsif I18n.locale == :en
			number_to_currency(event.price)
		elsif I18n.locale == :ru
			"#{event.price} тг."
			# number_to_currency(event.price, locale: :kzt)
		end
	end

	def main_image(event)
		if event.main_image.attached?
			image_tag event.main_image.variant(resize_to_limit: [75, 75])
		else
			image_tag 'placeholder.png'
		end
	end
end
