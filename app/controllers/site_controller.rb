class SiteController < ApplicationController
  def index
  	@businesses = Business.all
  	@deals = Deal.all
  	render :index
  end

  def about
  end

  def contact
  end
end
