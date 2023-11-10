class ShowZoneScopesSerializer
  include FastJsonapi::ObjectSerializer
  include SerializerHelper

  attributes :id, :name, :total_hours, :expended_hours, :progress

  attribute :zone_references do |record|
    {
      zones_references = {
        green: record.green_zone,
        yellow_zone: record.yellow_zone,
        red_zone: record.red_zone
      }
    }
  end
end