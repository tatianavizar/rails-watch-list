class List < ApplicationRecord
  has_many :movies, dependent: :destroy
  has_many :bookmarks

  validates :name, presence: true, uniqueness: true
end
