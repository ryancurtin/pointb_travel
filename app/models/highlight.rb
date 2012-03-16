class Highlight < ActiveRecord::Base
  belongs_to :vacation
  attr_accessible :title, :description
end
