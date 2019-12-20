class Mode < ApplicationRecord
  has_many :check_points
  has_many :users
end
