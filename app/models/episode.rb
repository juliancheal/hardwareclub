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
end
