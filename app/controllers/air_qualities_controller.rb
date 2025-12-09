class AirQualitiesController < ApplicationController
  def index
    air_qualities = AirQuality.all
    render json: air_qualities
  end

  def create
    air_quality = AirQuality.create(air_quality_params)
    render json: air_quality, status: :created
  end

  private

  def air_quality_params
    params.require(:air_quality).permit(
      :device_id,
      :pm25,
      :co2,
      :humidity,
      :battery_level,
      :measured_at
    )
  end
end
