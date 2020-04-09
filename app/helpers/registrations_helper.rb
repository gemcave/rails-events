module RegistrationsHelper
	def register_link(event)
		if event.sold_out?
			content_tag(:strong, t('common.sold_out'))
		else
			link_to t('common.register'), new_event_registration_path(event), class: 'button ok register'
		end
	end
end