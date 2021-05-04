class List < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
  validates :name, uniqueness: true, length: { minimum: 1 }
  has_many :movies, through: :bookmarks
  has_one_attached :photo
end
