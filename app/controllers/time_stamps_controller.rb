class TimeStampsController < ApplicationController
  before_action :set_time_stamp, only: [:show, :update, :destroy]

  # GET /time_stamps or /time_stamps?location=location_name
  def index
    @time_stamps = TimeStamp.all_with_offset_by_location_name(params[:location])

    render json: @time_stamps.as_json(methods: :signature_with_time_zone, only: [:id])
  end

  # POST /time_stamps
  def create
    @time_stamp = TimeStamp.new(time_stamp_params)

    if @time_stamp.save
      render json: @time_stamp, status: :created, location: @time_stamp
    else
      render json: @time_stamp.errors, status: :unprocessable_entity
    end
  end

  # GET /time_stamps/1
  def show
    render json: @time_stamp
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_time_stamp
    @time_stamp = TimeStamp.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def time_stamp_params
    params.require(:time_stamp).permit(:signature)
  end
end
