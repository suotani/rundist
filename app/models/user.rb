class User < ApplicationRecord
  belongs_to :mode
  has_many :works
  has_many :healths

  validates :name, presence: true
end
