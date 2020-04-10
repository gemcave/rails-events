class CategoriesController < ApplicationController
	skip_before_action :verify_authenticity_token, raise: false

	def index
		categories = Category.all
		if current_user_admin?
			render json: categories.as_json(only: :name), status: :ok
		else
			head(:unauthorized)
		end
	end

	def create
		@category = Category.new(category_params)
		if @category.save
			render json: {status: 'SUCCESS', message: 'Articles successfuly created', data:@category}, status: :ok	 
		else
			render json: {status: 'SUCCESS', message: 'Article NOT successfuly created', data:@category},
			 status: :unprocessable_entity
		end
	end


	private
	def category_params
		params.permit(:name)
	end
end