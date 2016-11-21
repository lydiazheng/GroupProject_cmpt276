class Location < ActiveRecord::Base
  reverse_geocoded_by :latitude, :longitude, :address => :address
  after_validation :reverse_geocode  # auto-fetch address
  has_many :hunts
  has_many :games, through: :hunts

  has_many :game_histories

  has_attached_file :image, styles: {
    thumb: '100x100#',
    square: '200x200#',
    medium: '400x400>',
  }

  # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  validates_attachment_size :image, :less_than => 4.megabytes
end
