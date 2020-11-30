class BookingsController < ApplicationController
  def new
    # @influencer = Influencer.find(params[:influencer_id])
    # @campaign = Campaign.find(params[:campaign_id])
    @booking = Booking.new
    @booking.campaign = @campaign
    @booking.influencer = @influencer
    authorize @booking
  end

  def create
    @influencer = Influencer.find(params[:influencer_id])
    @campaign = Campaign.find(params[:campaign_id])
    @booking = Booking.new
    @booking.influencer = @influencer
    @booking.campaign = @campaign
    authorize @booking
    if @booking.save
      redirect_to campaign_path(@campaign)
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
    authorize @booking
    @campaign = @booking.campaign
    @booking.destroy
    redirect_to campaign_path(@campaign)
  end

  def update_status
    @booking = Booking.find(params[:id])
    @booking.update(status:params[:status])
    skip_authorization
    redirect_to solicitations_path
  end

  def show
    @booking = Booking.find(params[:id])
    authorize @booking
    respond_to do |format|
    format.html
    format.pdf do
      render pdf: "Contract"
      end
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:status)
  end
end
