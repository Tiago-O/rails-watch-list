class Movie < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
  validates :title, uniqueness: true, length: { minimum: 1 }
  validates :overview, length: { minimum: 1 }
end
