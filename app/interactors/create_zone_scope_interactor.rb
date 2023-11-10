class CreateZoneScopeInteractor
  def initialize(params)
    @name = params[:name]
    @turns = params[:turns]
    @hours = @turns * 4
  end

  def create_zones
    green_zone = @hours - (@hours*75.0)/100
    yellow_zone = @hours - (@hours*50.0)/100
    red_zone = @hours - (@hours*25.0)/100
    total_hours = @turns * 4


    zone_scope = ZoneScope.create(
      name: @name,
      green_zone: green_zone,
      yellow_zone: yellow_zone,
      red_zone: red_zone,
      total_hours: total_hours,
      progress: 0
    )

    return zone_scope
  end
end
