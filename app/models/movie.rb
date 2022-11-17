class Movie < ApplicationRecord
  has_many :bookmarks
  has_many :lists, through: :bookmarks

  validates :title, presence: true, uniqueness: true, allow_blank: false
  validates :overview, presence: true, uniqueness: true, allow_blank: false
end
