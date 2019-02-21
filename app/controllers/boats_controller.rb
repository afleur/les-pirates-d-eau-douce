class BoatsController < ApplicationController
  before_action :set_boats, only: :show
  skip_before_action :authenticate_user!, only: [:index, :show]

  def new
    @boat = Boat.new
  end

  def create
    @boat = Boat.new(params_boat)
    @boat.user = current_user
    if @boat.save
      redirect_to boat_path(@boat), notice: 'Boat was successfully added.'
    else
      render :new
    end
  end

  def index
    @boats = Boat.all
    @user = current_user
  end

  def index
    @boats = Boat.where.not(latitude: nil, longitude: nil)
    @markers = @boats.map do |boat|
      {
        lng: boat.longitude,
        lat: boat.latitude
      }
    end
  end



  def show
    @rental = Rental.new
  end

  private

  def set_boats
    @boat = Boat.find(params[:id])
  end

  def params_boat
    params.require(:boat).permit(:name, :category, :price_per_day, :description, :photo, :address, :user_id)
  end
end
