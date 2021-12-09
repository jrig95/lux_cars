class RentalsController < ApplicationController
    before_action :set_list, only: [:new, :create]
  def new
    @rental = Rental.new
    authorize @rental
  end
  def create
    @rental = Rental.new(rental_params)
    @rental.car = @car
    authorize @rental
    if @rental.save
      redirect_to car_path(@car)
    else
      render :new
    end
  end
  def destroy
    @rental = Rental.find(params[:id])
    @rental.destroy!
    redirect_to cars_path
  end

  private
  def set_list
    @car = Car.find(params[:car_id])
  end
  def rental_params
    params.require(:rental).permit(:status, :user_id)
  end

end
