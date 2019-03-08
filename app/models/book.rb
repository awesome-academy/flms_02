class Book < ApplicationRecord
  belongs_to :publisher
  belongs_to :category
  has_many :likes, dependent: :destroy
  has_many :ratings, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :requests, dependent: :destroy
  has_many :author_books
  has_many :authors, through: :author_books

  validates :name, presence: true,
    length: {maximum: Settings.models.book.max_name}
  validates :num_of_pages, presence: true, numericality: {only_integer: true}
  validates :image, presence: true
  validates :content, presence: true
  validates :quantity, presence: true, numericality: {only_integer: true}
  validates :price, presence: true, numericality: {only_integer: true}
end
