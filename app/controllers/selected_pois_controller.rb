class SelectedPoisController < ApplicationController
  before_action :set_selected_poi, only: %i[ show update destroy ]

  # GET /selected_pois
  def index
    @selected_pois = SelectedPoi.all

    render json: @selected_pois
  end

  # GET /selected_pois/1
  def show
    render json: @selected_poi
  end

  # POST /selected_pois
  def create
    @selected_poi = SelectedPoi.new(selected_poi_params)

    if @selected_poi.save
      render json: @selected_poi, status: :created, location: @selected_poi
    else
      render json: @selected_poi.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /selected_pois/1
  def update
    if @selected_poi.update(selected_poi_params)
      render json: @selected_poi
    else
      render json: @selected_poi.errors, status: :unprocessable_entity
    end
  end

  # DELETE /selected_pois/1
  def destroy
    @selected_poi.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_selected_poi
      @selected_poi = SelectedPoi.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def selected_poi_params
      params.require(:selected_poi).permit(:trip_id, :poi, :day)
    end
end
