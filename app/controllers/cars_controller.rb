class CarsController < ApplicationController
  def index
    @cars = Car.all
  end

  def new
    @car = Car.new
  end

  # def create
  #   @car = Car.new(car_params)
  # end
  #
  # def new
  #   @car = Car.new
  # end
  #
  # def update
  #   if @car.update(car_params)
  #     flash[:success] = 'Car successfully updated!'
  #     redirect_to car_path
  #   else
  #     render :edit
  #   end
  # end
  #

  private

  def car_params
    params.require(:car).permit(:location, :rentals, :users)
  end
end
