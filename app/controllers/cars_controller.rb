class CarsController < ApplicationController
  before_action :set_car, only: [:show, :edit, :update, :destroy]


  def index
    # for searching for the year
    if params[:query].present? && params[:query].to_i != 0
      @cars = Car.where(year: params[:query])
    elsif params[:query].present?
      sql_query = "name ILIKE :query OR location ILIKE :query OR description ILIKE :query OR model ILIKE :query"
      @cars = Car.where(sql_query, query: "%#{params[:query]}%")
    else
      @cars = Car.all
    end
  end

  def show
    # @car = Car.find(params[:id])
    @rental = Rental.new
    @marker =
      {
        lat: @car.latitude,
        lng: @car.longitude
      }
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
    params.require(:car).permit(:name, :description, :year, :model, :location, :photo)
  end
end
