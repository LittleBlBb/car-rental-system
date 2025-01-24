class RentalsController < ApplicationController
  before_action :set_rental!, only: [:show, :edit, :update, :destroy]
  before_action :set_cars!, only: [:new, :edit]
  before_action :set_users!, only: [:new, :edit]

  def index
    @rentals = Rental.includes(:car, :user).all
  end

  def show
  end

  def edit
  end

  def new
    @rental = Rental.new
  end

  def create
    @rental = Rental.new(rental_params)
    if @rental.save
      flash[:success] = "Rental successfully created"
      redirect_to rentals_path
    else
      set_cars!
      set_users!
      render "new"
    end
  end

  def update
    if @rental.update(rental_params)
      flash[:success] = "Rental successfully updated"
      redirect_to rentals_path
    else
      set_cars!
      set_users!
      render "edit"
    end
  end

  def destroy
    @rental.destroy
    flash[:success] = "Rental successfully deleted"
    redirect_to rentals_path
  end

  private

  def set_cars!
    @cars = Car.all
  end

  def set_rental!
   @rental = Rental.find(params[:id])
  end

  def set_users!
    @users = User.all
  end

  def rental_params
    params.require(:rental).permit(:car_id, :user_id, :start_date, :end_date, :total_price)
  end
end
