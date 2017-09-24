class Identity < ApplicationRecord
  belongs_to :user
  validates :uid, :provider, presence: true
  validates :uid, uniqueness: { :scope => :provider }

  def self.find_for_oauth(auth)
    identity = find_by(provider: auth.provider, uid: auth.uid)
    identity = create(uid: auth.uid, provider: auth.provider) if identity.nil?
    identity
  end
end
