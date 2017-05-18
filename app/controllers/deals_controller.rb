class DealsController < ApplicationController
  # before_action :authorize, except: [:index, :show]

  # show ALL businesss in db
  def index
    @deals = Deal.all
    render :index
  end

  # form to create new business
  def new
  	@business = Business.find(params[:business_id])
    @deal= Deal.new
    render :new
  end


  # creates new deal in db
  # that BELONGS TO business
  def create
  	@business = Business.find(params[:business_id])
  	deal = @business.deals.create(deal_params)
  	deal.save
  	if deal.save
  	  flash[:notice] = "Successfully created deal!"
  		redirect_to business_path(@business)
  		else
  		  flash[:error] = deal.errors.full_messages.join(", ")
  		  redirect_to root_path
  	end
  end

  def show 
    # CJ: opportunity to dry up the `Deal.find` and `Business.find` logic
    # with private methods since it's repeated in multiple controller actions
  	@deal = Deal.find(params[:id])
    # CJ: `params[:business_id]`?
  	@business = Business.find(params[:id])
  	render :show
  end

  def edit
    @deal = Deal.find(params[:id])
    # CJ: `@business = @deal.business` is DRYer
    @business = Business.find(@deal.business.id)
    render :edit
  end

  def update
    @deal = Deal.find(params[:id])
    # CJ: `@business = @deal.business` is DRYer
    @business = @deal.business_id 
    # if current_user.@npos.include? @npo
      @deal.update_attributes(deal_params)
      redirect_to business_path(@business)
    # else 
    #   redirect_to root_path
    # end
  end

  def destroy
    deal = Deal.find(params[:id])
    deal.destroy
    redirect_to profile_path
  end

  private
    def deal_params
      params.require(:deal).permit(:name, :name2, :details, :price, :website , :value, :id, :avatar)
    end
end


