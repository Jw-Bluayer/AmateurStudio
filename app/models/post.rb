class Post < ApplicationRecord
	resourcify
	mount_uploader :image, S3Uploader

	belongs_to :user
end
