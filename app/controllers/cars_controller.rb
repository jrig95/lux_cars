class CarsController < ApplicationController
  before_action :set_car, only: [:show, :edit, :update, :destroy]

  def index
    # @cars = Car.all
    @cars = policy_scope(Car).order(created_at: :desc)
  end

  def show
    # @car = Car.find(params[:id])
  end

  def new
    @car = Car.new
    authorize @car
  end

  def edit
  end

  def create
    @car = Car.new(car_params)
    @car.user = current_user
    authorize @car

    if @car.save!
      redirect_to @car, notice: "Car was successfully created."
    else
      render :new
    end
  end

  def destroy
    @car = Car.find(params[:id])
    @car.destroy!
    respond_to do |format|
      format.html { redirect_to cars_path, notice: "List was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_car
    @car = Car.find(params[:id])
    authorize @car
  end

  def car_params
    params.require(:car).permit(:name, :description, :year, :model, :location)
  end
end
