class Post < ApplicationRecord
	resourcify
	mount_uploader :image, S3Uploader

	belongs_to :user
	has_many :comments, dependent: :destroy
	has_and_belongs_to_many :tags


	after_create do 
		post = Post.find_by(id: self.id)
		hashtags = self.content.scan(/#\w+/)
		hashtags.uniq.map do |hashtag|
			tag = Tag.find_or_create_by(name: hashtag.downcase.delete('#'))
			post.tags << tag
		end
	end

	before_update do
		post = Post.find_by(id: self.id)
		post.tags.clear #delete all and add again
		hashtags = self.content.scan(/#\w+/)
		hashtags.uniq.map do |hashtag|
			tag = Tag.find_or_create_by(name: hashtag.downcase.delete('#'))
			post.tags << tag

		end
	end



end
