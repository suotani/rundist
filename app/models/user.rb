class User < ApplicationRecord
  belongs_to :mode
  has_many :works

  validates :name, presence: true
end
