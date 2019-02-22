class RentalsController < ApplicationController
  def index
  end

  def show
    @rental = Rental.find(params[:id])
  end

  def new
    @boat = Boat.find(params[:boat_id])
    @rental = Rental.new
  end

  def create
    @boat = Boat.find(params[:boat_id])
    @rental = Rental.new(rental_params)
    @rental.user = current_user
    @rental.boat = @boat
    if @rental.save
      redirect_to boat_rental_path(@boat, @rental), notice: 'Votre bateau est réservé.'
    else
      redirect_to boat_path(@boat), alert: 'Date invalide. Tournez-vous vers le futur!'
    end
  end

  def destroy
  end

  def edit
  end

  def update
  end

  private

  def rental_params
    params.require(:rental).permit(:checkindate, :checkoutdate, :user_id, :boat_id)
  end
end
