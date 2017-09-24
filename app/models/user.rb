class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable


	has_many :friendships
	has_many :received_friendships, class_name: "Friendship", foreign_key: "friend_id"

	has_many :active_friends, -> { where(friendships: { accepted: true}) }, through: :friendships, source: :friend
	has_many :received_friends, -> { where(friendships: { accepted: true}) }, through: :received_friendships, source: :user
	has_many :pending_friends, -> { where(friendships: { accepted: false}) }, through: :friendships, source: :friend
	has_many :requested_friendships, -> { where(friendships: { accepted: false}) }, through: :received_friendships, source: :user

  has_many :posts
  has_many :comments

  validates_presence_of :name

	def friends
	  active_friends | received_friends
	end

	def pending
		pending_friends | requested_friendships
	end

 def self.find_for_oauth(auth, signed_in_resource = nil)

    # Get the identity and user if they exist
    identity = Identity.find_for_oauth(auth)

    # If a signed_in_resource is provided it always overrides the existing user
    # to prevent the identity being locked with accidentally created accounts.
    # Note that this may leave zombie accounts (with no associated identity) which
    # can be cleaned up at a later date.
    user = signed_in_resource ? signed_in_resource : identity.user

      # Create the user if it's a new registration
      if user.nil?
        user = User.new(
          name: auth.info.name || auth.extra.nickname ||  auth.uid,
          password: Devise.friendly_token[0,20]
        )
        user.skip_confirmation!
        user.save!
      end
    end

    # Associate the identity with the user if needed
    if identity.user != user
      identity.user = user
      identity.save!
    end

    user

  end

  def email_verified?
    self.email && self.email !~ TEMP_EMAIL_REGEX
  end


  mount_uploader :image, S3Uploader

end
