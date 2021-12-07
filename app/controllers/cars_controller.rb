class CarsController < ApplicationController
  def index
    @cars = Car.all
  end

  def show
    @car = Car.find(params[:id])
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    if @car.save!
      # redirect_to car_path(@car)
      puts "car saved"
    else
      render :new
    end
  end

  def destroy
    @car = Car.find(params[:id])
    @Car.destroy!
    respond_to do |format|
      format.html { redirect_to lists_path, notice: "List was successfully destroyed." }
      format.json { head :no_content }
    end
    redirect_to car_path
  end

  private

  def car_params
    params.require(:car).permit(:name, :description, :year, :model, :location)
  end
end
