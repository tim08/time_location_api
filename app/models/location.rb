class Location < ApplicationRecord
  validates :name, :latitude, :longitude, presence: true
  validates :name, uniqueness: true
  validate :timezone_exists, unless: 'time_zone.blank?'

  private

  def timezone_exists
    if ActiveSupport::TimeZone[time_zone].blank?
      errors.add(:time_zone, "Incorrect name, use one of the list: #{ActiveSupport::TimeZone.all.map(&:name).join(', ')}")
    end
  end

end
