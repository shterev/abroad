class Event < ActiveRecord::Base
  has_many :participations
  has_many :users, through: :participations

  validates :title,
            presence: true

  validates :description,
            presence: true

  validates :date,
            presence: true
end
