class Episode < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged
  
  acts_as_taggable
  
  def self.published
    where(published: true)
  end
  
  def self.published?
    self.published
  end
  
  def title
    self.name
  end
  
  def to_time
    time = self.seconds
    hours = time/3600.to_i
    minutes = (time/60 - hours * 60).to_i
    
    seconds = (time - (minutes * 60 + hours * 3600))
    
    sprintf("%02d:%02d:%02d", hours, minutes, seconds)
  end
end
