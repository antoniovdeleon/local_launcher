class FollowsController < ApplicationController

	def create
		business = Business.find_by_id(follow_params[:business_id])
		if current_user.follow_businesses.include? business
			render json: {}, status: :bad_request
		else
			@follow = current_user.follows.new(follow_params)
			if @follow.save
				render json: @follow
			else
				render json: { errors: @follow.errors.full_messages }, status: :unprocessable_entity
			end
		end
	end

	private
		def follow_params
			params.require*(:follow).permit(:business_id)
		end	

end