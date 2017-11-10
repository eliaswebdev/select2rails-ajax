class User < ApplicationRecord

  def self.collection
    User.all.map do |user|
      { label: user.name, value: user.id }
    end
  end  
end
