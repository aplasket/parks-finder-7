class Park
  attr_reader :full_name,
              :description,
              :directions_info,
              :standard_hours

  def initialize(data)
    @full_name = data[:fullName]
    @description = data[:description]
    @directions_info = data[:directionsInfo]
    @standard_hours = format_days(data[:operatingHours][0][:standardHours])
  end

  def format_days(data)
    ordered_schedule = data.sort_by { |day, _| Date.parse(day.to_s).wday }
    formatted_schedule = ordered_schedule.to_h
  end
end