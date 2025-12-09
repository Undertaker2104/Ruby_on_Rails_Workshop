class AirQuality < ApplicationRecord
  # verplichte velden
  validates :device_id, presence: true
  validates :pm25, presence: true
  validates :battery_level, presence: true

  # range limiting
  validates :battery_level, inclusion: { in: 0..100 }
  validates :humidity,      inclusion: { in: 0..100 }, allow_nil: true
  validates :pm25,          numericality: { greater_than_or_equal_to: 0 }
  validates :co2,           inclusion: { in: 300..5000 }, allow_nil: true
end
