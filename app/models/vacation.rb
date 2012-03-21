class Vacation < ActiveRecord::Base
  has_many :highlights, :dependent => :destroy

  accepts_nested_attributes_for :highlights
  attr_accessible :user_id, :name, :image, :description, :destination, :highlights_attributes
  belongs_to :user
  mount_uploader :image, ImageUploader
  
  
  # Will need to set up a rake task to get the most popular destinations
  # destinations = []
  # User.all.each do |x|
  #   destinations << x
  # end
  # freq = destinations.inject(Hash.new(0)) { |h,v| h[v] += 1; h }
  # destinations.sort_by { |v| freq[v] }.uniq.reverse[0..4]
  
end
