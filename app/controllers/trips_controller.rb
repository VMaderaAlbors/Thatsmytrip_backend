class TripsController < ApplicationController
  before_action :set_trip, only: %i[ show update destroy ]

  # GET /trips
  def index
    if params[:user_name].present?
      @trips = Trip.where(user_name: params[:user_name])
    elsif params[:destination_id].present?
       @trips = Trip.where(destination_id: params[:destination_id])
    else
    @trips = Trip.all
    end
    render json: @trips
  end

  # GET /trips/1
  def show
    render json: @trip
  end
  

  # POST /trips
  def create
    @trip = Trip.new(trip_params)

    if @trip.save
      render json: @trip, status: :created, location: @trip
    else
      render json: @trip.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /trips/1
  def update
    if @trip.update(trip_params)
      render json: @trip
    else
      render json: @trip.errors, status: :unprocessable_entity
    end
  end

  # DELETE /trips/1
  def destroy
    @trip.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trip
      @trip = Trip.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def trip_params
      params.require(:trip).permit(:destination_id, :acomodation_id, :stay, :user_name, :published)
    end
end
