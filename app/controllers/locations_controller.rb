# frozen_string_literal: true

class LocationsController < ApplicationController
  before_action :set_location!, only: [:show, :edit, :update, :destroy]
  def index
    @locations = Location.all
  end

  def new
    @location = Location.new
  end

  def create
    @location = Location.new(location_params)
    if @location.save
      flash[:success] = "location successfully created!"
      redirect_to locations_path
    else
      render "new"
    end
  end

  def edit
  end

  def show
  end
  def update
    if @location.update(location_params)
      flash[:success] = "location successfully updated!"
      redirect_to locations_path
    else
      render "edit"
    end
  end

  def destroy
    @location.destroy
    flash[:success] = "location successfully deleted!"
    redirect_to locations_path
  end

  private

  def set_location!
    @location = Location.find(params[:id])
  end

  def location_params
    params.require(:location).permit(:city, :address)
  end
end
