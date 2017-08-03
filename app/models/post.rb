class Post < ApplicationRecord
	mount_uploader :image, S3Uploader

	belongs_to :user
end
