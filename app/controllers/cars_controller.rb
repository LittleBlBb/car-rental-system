class CarsController < ApplicationController
  before_action :set_car!, only: [:show, :edit, :update, :destroy]
  before_action :set_locations!, only: [:new, :edit]
  before_action :set_users!, only: [:new, :edit]

  def index
    @cars = Car.includes(:location).all
  end

  def show
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    if @car.save
      flash[:success] = 'Car created successfully.'
      redirect_to cars_path
    else
      set_locations!
      set_users!
      render :new
    end
  end

  def edit
  end

  def update
    if @car.update(car_params)
      flash[:success] = 'Car updated successfully.'
      redirect_to cars_path
    else
      set_locations!
      set_users!
      render :edit
    end
  end

  def destroy
    @car.destroy
    flash[:success] = 'Car deleted successfully.'
    redirect_to cars_path
  end

  private

  def set_car!
    @car = Car.find(params[:id])
  end

  def set_locations!
    @locations = Location.all
  end

  def set_users!
    @users = User.all
  end

  def car_params
    params.require(:car).permit(:brand, :model, :year, :price_per_day, :location_id)
  end
end
