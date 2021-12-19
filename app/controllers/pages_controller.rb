class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
   render layout: 'home'
  end

  def about
  end

  def profile
    @user = current_user
  end

  def update
  rental_id = params[:request_id]
  @rental = Rental.find(rental_id)
  @rental.update_attribute(:status, true)
  end
end
