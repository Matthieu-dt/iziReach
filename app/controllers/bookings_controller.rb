class BookingsController < ApplicationController

  def index
    @bookings = Booking.all
  end

  def new
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    authorize @booking
    @booking.influencer = Influencer.find(params[:influencer_id])
    @booking.campaign = Campaign.find(params[:campaign_id])
    if @booking.save
      redirect_to campaign_path(@booking.campaign)
    else
      render :new
    end
  end

  def edit
    @booking_id = Booking.find(params[:id])
    authorize @booking
  end

  def update
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.update(booking_params)
    redirect_to campaign_path(@booking.campaign)
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.delete
  end

  private

  def booking_params
    params.require(:influencer).permit(:influencer, :campaign, :status)
  end
end
