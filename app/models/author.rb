class Author < ApplicationRecord
  has_many :author_books
  has_many :books, through: :author_books
  has_many :follows, dependent: :destroy

  validates :name, presence: true, uniqueness: {case_sensitive: false},
    length: {maximum: Settings.models.author.max_name}
  validates :phone, presence: true,
    length: {maximum: Settings.models.author.max_phone}
  validates :address, presence: true

  scope :alphabet, ->{order name: :asc}
end
