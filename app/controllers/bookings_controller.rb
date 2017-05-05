class BookingsController < ApplicationController
  before_action :set_booking, only: [:new, :create, :edit, :update, :destroy]
  before_filter :must_login?, only: [:new, :edit, :destroy]
  before_action :authenticate_user!  # GET /bookings
  def index
    @bookings = Booking.all
  end

  # GET /bookings/new
  def new
    @booking = @house.bookings.new
  end

  # GET /bookings/1/edit
  def edit
  end

  # POST /bookings
  def create
    @booking = @house.bookings.new(booking_params)
    @booking.user = current_user
    if @booking.save
      redirect_to profile_index_path, notice: 'Booking was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /bookings/1
  def update
    if @booking.update(booking_params)
      redirect_to @house, notice: 'Booking was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /bookings/1
  def destroy
    @booking.destroy
    redirect_to bookings_url, notice: 'Booking was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking
      @house = House.find(params[:house_id])
    end

    # Only allow a trusted parameter "white list" through.
    def booking_params
      params.fetch(:booking).permit(:checkin, :checkout, :occupancy)
    end
end
