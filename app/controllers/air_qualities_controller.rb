class AirQualitiesController < ApplicationController
  def index
    if params[:device_id].present?
      data = AirQuality.where(device_id: params[:device_id])
    else
      data = AirQuality.all
    end

    render json: data
  end


  def create
    air_quality = AirQuality.new(air_quality_params)

    if air_quality.save
      render json: air_quality, status: :created
    else
      render json: { errors: air_quality.errors.full_messages },
            status: :unprocessable_entity
    end
  end


  private

  def air_quality_params
    params.require(:air_quality).permit(
      :device_id,
      :pm25,
      :co2,
      :humidity,
      :battery_level,
      :measured_at,
      :location
    )
  end
end
