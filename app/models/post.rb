class Post < ApplicationRecord
	resourcify
	mount_uploader :image, S3Uploader

	belongs_to :user
	has_many :comments, dependent: :destroy
end
