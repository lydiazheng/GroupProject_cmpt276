class Game < ActiveRecord::Base
  # add the accessors for the two fields
  belongs_to :organizer, class_name: "User", foreign_key: "organizer_id"

  has_many :hunts, dependent: :delete_all
  has_many :locations, through: :hunts

  has_many :plays, dependent: :delete_all
  has_many :users, through: :plays

  has_many :game_histories

  reverse_geocoded_by :latitude, :longitude, :address => :address

  validates :title, presence: true, length: { maximum: 64 }
  validates :duration, presence: true, numericality: { greater_than_or_equal_to: 5, less_than_or_equal_to: 120}
  validates :starts_at_time, presence: true
  validates :starts_at_date, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true
  validates :locations, presence: true

  after_validation :reverse_geocode  # auto-fetch address


end
