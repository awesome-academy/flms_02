class Author < ApplicationRecord
  has_many :author_books
  has_many :books, throught: :author_books
  has_many :follows, dependent: :destroy

  validates :name, presence: true,
    length: {maximum: Settings.models.author.max_name}
  validates :phone, presence: true,
    length: {maximum: Settings.models.author.max_phone}
  validates :address, presence: true
end