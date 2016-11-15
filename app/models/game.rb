class Game < ActiveRecord::Base
  # add the accessors for the two fields
  attr_accessor :starts_at_date, :starts_at_time


  geocoded_by :address
  after_validation :geocode
end
