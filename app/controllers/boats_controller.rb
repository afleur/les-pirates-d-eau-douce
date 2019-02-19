class BoatsController < ApplicationController
  mount_uploader :photo, PhotoUploader
  before_action :set_boats, only: :show

  def new
    @user = User.find(params[:user_id])
    @boat = Boat.new
  end

  def create
    @user = User.find(params[:user_id])
    @boat = Boat.new(params_boat)
    @boat.user = @user
    if @boat.save
      redirect_to boat_path(@boat), notice: 'Boat was successfully added.'
    else
      render :new
    end
  end

  def index
    @boats = Boat.all
  end

  def show
  end

  private

  def set_boats
    @boat = Boat.find(params[:id])
  end

  def params_boat
    params.require(:boat).permit(:name, :category, :price_per_day, :description, :picture, :address, :user_id)
  end
end
