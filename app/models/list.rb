class List < ApplicationRecord
  has_many :bookmarks
  validates :name, uniqueness: true, length: { minimum: 1 }
  has_many :movies, through: :bookmarks, dependent: :destroy
  has_one_attached :photo
end
