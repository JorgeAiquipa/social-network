class Position < ActiveRecord::Base
  attr_accessible :lat, :lng, :name, :description
end
