class BusinessesController < ApplicationController
  before_action :authorize, except: [:index, :show]



  # show ALL businesss in db
  def index
    @businesses = Business.all
    render :index
  end

  # form to create new business
  def new
    @business= Business.new
    render :new
  end

  # creates new business in db
  # that BELONGS TO current_user
  def create
    # business = Business.create(business_params)
    # current_user.businesss << business
    # business = current_user.businesses.create(business_params)
    # redirect_to business_path(business)
    
    business = current_user.businesses.new(business_params)
    if business.save
      flash[:notice] = "Successfully created business."
      redirect_to business_path(business)
    else
      flash[:error] = business.errors.full_messages.join(", ")
      redirect_to new_business_path
    end
  end

  def show
    # CJ: opportunity to dry up the `Business.find` logic with a private
    # method since it's repeated in `show`, `edit`, `update`, and `destroy`
    @business= Business.find(params[:id])
    # CJ: very cool! move this logic to an instance method
    # on the business model to clean up the controller
    # something like `def progress` that runs all the same logic
    @business_progress = 0
    if @business.business_name
      @business_progress = @business_progress + 1
    end
    if @business.address
      @business_progress = @business_progress + 1
    end
    if @business.category
      @business_progress = @business_progress + 1
    end
    if @business.introduction
      @business_progress = @business_progress + 1
    end
    if @business.website
      @business_progress = @business_progress + 1
    end
    if @business.avatar
      @business_progress = @business_progress + 1
    end
    if @business.deals.any?
        @business_progress = @business_progress + 1
        @business.deals.each do |deal| 
          if deal.name
            @business_progress = @business_progress + 1
          end
          if deal.name2
            @business_progress = @business_progress + 1
          end
          if deal.name2
            @business_progress = @business_progress + 1
          end
          if deal.details
            @business_progress = @business_progress + 1
          end
          if deal.price
            @business_progress = @business_progress + 1
          end
          if deal.value
            @business_progress = @business_progress + 1
          end
        end
      end
    render :show
  end

  # form to edit one business
  def edit
    @business= Business.find(params[:id])
    if current_user.businesses.include? @business      
      render :edit
    else
      # if user tries to edit business that doesn't belong to them
      # log them out
      session[:user_id] = nil
      redirect_to login_path
    end
  end

  # updates business in db
  def update
    business = Business.find(params[:id])
    if current_user.businesses.include? business
      business.update_attributes(business_params)
      redirect_to business_path(business)
    else
      # if user tries to update business that doesn't belong to them
      # log them out
      session[:user_id] = nil
      redirect_to login_path
    end
  end

  def destroy
    business = Business.find(params[:id])
    if current_user.businesses.include? business
      business.destroy
      redirect_to profile_path
    else
      # if user tries to destroy business that doesn't belong to them
      # log them out
      session[:user_id] = nil
      redirect_to login_path
    end
  end

  private
    def business_params
      params.require(:business).permit(:business_name, :address, :contact_info, :category, :introduction, :website , :created_at, :avatar)
    end


end