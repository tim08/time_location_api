class TimeStamp < ApplicationRecord

  validate :check_present_valid_signature
  attr_accessor :signature_with_time_zone

  def signature=(signature)
    case
      when signature =~ /^(1[0-9]|0[1-9]):[0-5][0-9] (0[1-9]|1[0-9]|2[0-9]|3[0-1])\.(0[1-9]|1[0-2])$/
        valid_signature = DateTime.parse(signature)
      when signature == 'end'
        valid_signature = DateTime.now.end_of_day
      when signature == 'beginning'
        valid_signature = DateTime.now.beginning_of_day
    end
    @signature = valid_signature
    write_attribute(:signature, valid_signature)
  end

  def self.all_with_offset_by_location_name(location_name)
    location = Location.find_by_name(location_name)
    # пишем в виртуальный атрибут данные временных меток со смещение по времени в зависимости от наличия локации
    if location
      all.each {|ts| ts.signature_with_time_zone = ts.signature.in_time_zone(location.time_zone)}
    else
      all.each {|ts| ts.signature_with_time_zone = ts.signature.in_time_zone('UTC')}
    end

  end

  private

  def check_present_valid_signature
    errors.add(:signature, "signature can be 'end', 'beginning' or format 'hour:minutes day.month'") if @signature.nil?
  end

end
