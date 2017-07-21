class Post < ApplicationRecord
  mount_uploader :image, S3Uploader
end
