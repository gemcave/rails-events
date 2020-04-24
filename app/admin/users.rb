ActiveAdmin.register User do
	permit_params :name, :email, :password, :admin, :encrypted_password, :reset_password_token, :reset_password_sent_at

	form do |f|
		f.inputs "Admin Details" do
		f.input :name
		f.input :email
		f.input :password
		f.input :encrypted_password
		f.input :reset_password_token
		f.input :reset_password_sent_at
		# f.input :password_confirmation
		f.input :admin
		end
		f.actions
	end
end
