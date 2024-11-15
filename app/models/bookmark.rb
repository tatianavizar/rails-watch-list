class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list
  validates :movie, presence: true, allow_blank: false
  validates :list, presence: true, allow_blank: false
  validates_uniqueness_of :movie_id, :scope => [:list_id]
  validates_length_of :comment, :minimum => 6, :too_short => "please enter at least 6 characters"
end
