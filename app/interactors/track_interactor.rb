class TrackInteractor
  include Helpers::ZoneCondition

  def initialize(id)
    @zone_scope = ZoneScope.find(id)
    @progress = @zone_scope.progress
    @expended_hours = @zone_scope.expended_hours
    @total_hours = @zone_scope.total_hours
    @hours_remaining = "#{@zone_scope.total_hours - @zone_scope.expended_hours}"
    @green_zone = @zone_scope.green_zone
    @yellow_zone = @zone_scope.yellow_zone
    @red_zone = @zone_scope.red_zone
  end

  def calculate
    case zone_condition[:zone]
    when :green_zone
      response = zone_condition
    when :yellow_zone
      response = zone_condition
    when :red_zone
      response = zone_condition
    when :completed
      response = { response: "Você completou a tarefa! Descanse um pouco!"}
    end

    return response
  end


  private

  def zone_condition
    case @progress
    when 0..30
      response = progress_less_then_30_case
    when 31..50
      response = progress_30_50_case
    when 50..75
      response = progress_50_75_case
    when 76..99
      response = progress_more_then_75_case
    when 100
      response = progress_completed
    end

    return response
  end
end
