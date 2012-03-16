class Vacation < ActiveRecord::Base
  has_many :highlights, :dependent => :destroy
  accepts_nested_attributes_for :highlights
  attr_accessible :user_id, :name, :image, :description, :destination, :highlights_attributes
  belongs_to :user
  mount_uploader :image, ImageUploader
end
