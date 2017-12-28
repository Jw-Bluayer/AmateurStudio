class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


	has_many :friendships
	has_many :received_friendships, class_name: "Friendship", foreign_key: "friend_id"

	has_many :active_friends, -> { where(friendships: { accepted: true}) }, through: :friendships, source: :friend
	has_many :received_friends, -> { where(friendships: { accepted: true}) }, through: :received_friendships, source: :user
	has_many :pending_friends, -> { where(friendships: { accepted: false}) }, through: :friendships, source: :friend
	has_many :requested_friendships, -> { where(friendships: { accepted: false}) }, through: :received_friendships, source: :user
	has_many :likes
	has_many :liked_posts, through: :likes, source: :post
    has_many :posts 
    has_many :comments

	def friends
	  active_friends | received_friends
	end

	def pending
		pending_friends | requested_friendships
	end

	def is_like? (post)
  		Like.find_by(user_id: self.id, post_id: post.id).present?
	end

	

  mount_uploader :image, S3Uploader

end
