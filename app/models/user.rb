class User < ActiveRecord::Base
  has_many :pushes

  def self.find_or_create_from_auth_hash(auth_hash)
    provider = auth_hash[:provider]
    uid = auth_hash[:uid]
    image_url = auth_hash[:info][:image]
    name = auth_hash[:info][:name]
    p provider: provider, uid: uid, image_url: image_url, name: name

    User.find_or_create_by(provider: provider, uid: uid) do |user|
      user.name = name
      user.image_url = image_url
    end
  end
end
