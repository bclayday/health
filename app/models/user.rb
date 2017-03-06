class User < ActiveRecord::Base

  
  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
    end
  end

  # the following code pulls user avatars from FB:

  def largeimage
			"https://runkeeper.com/apps/authorize"
  end
  
  def normalimage
    
  end
end