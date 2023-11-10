class ZoneScope < ApplicationRecord

  def zones
    zones = {
      green_zone: self.green_zone,
      yellow_zone: self.yellow_zone,
      red_zone: self.red_zone
    }

    return zones
  end
end