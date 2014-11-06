class Episode < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged
  
  acts_as_taggable
end
