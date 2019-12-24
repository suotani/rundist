class CheckPoint < ApplicationRecord
  belongs_to :mode

  validates :dist, presence: true
  validates :start_point, presence: true
end
