class Profile < ApplicationRecord
  mount_uploader :image, S3Uploader
end
