class User < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader

  has_many :participations
  has_many :events, through: :participations

  validates :first_name,
            presence: true

  validates :last_name,
            presence: true
end
