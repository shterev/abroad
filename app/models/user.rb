class User < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader

  validates :first_name,
            presence: true

  validates :last_name,
            presence: true
end
