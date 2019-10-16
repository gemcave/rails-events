module ApplicationHelper
	def page_title
		if content_for?(:title)			
			"Eventz - #{content_for(:title)}"
		else
			"Eventz"
		end
	end
end
