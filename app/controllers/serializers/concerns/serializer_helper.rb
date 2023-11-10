# frozen_string_literal: true
module SerializerHelper
  extend ActiveSupport::Concern

  def sanitized_hash
    return {} if to_hash[:data].blank?

    if to_hash[:data].is_a?(Array)
      data = to_hash[:data].collect do |hsh|
        hsh[:attributes]
        # hsh[:relationships]
      end
    else
      data = to_hash[:data][:attributes]
    end

    return data
  end
end
