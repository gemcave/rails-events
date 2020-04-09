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

	def image_for(event)
		if event.image_file_name.blank?
			image_tag 'placeholder.png'
		else
			image_tag event.image_file_name
		end
	end
end
