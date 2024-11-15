class Movie < ApplicationRecord
  has_many :bookmarks, :dependent => :destroy
  # belongs_to :lists
  validates :title, presence: true, uniqueness: true
  validates :overview, presence: true
end
