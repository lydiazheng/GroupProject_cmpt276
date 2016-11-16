class Game < ActiveRecord::Base
  # add the accessors for the two fields
  attr_accessor :starts_at_date, :starts_at_time
  belongs_to :organizer, class_name: "User", foreign_key: "organizer_id"

  has_many :hunts
  has_many :locations, through: :hunts

  has_many :plays
  has_many :users, through: :plays

  geocoded_by :address
  after_validation :geocode
end
