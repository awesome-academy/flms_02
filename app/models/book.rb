class Book < ApplicationRecord
  belongs_to :publisher
  belongs_to :category
  mount_uploader :image, ImageUploader

  has_many :likes, dependent: :destroy
  has_many :ratings, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :requests, dependent: :destroy
  has_many :author_books, dependent: :destroy
  has_many :authors, through: :author_books

  scope :newest, ->{order id: :desc}

  accepts_nested_attributes_for :author_books

  validates :name, presence: true,
    length: {maximum: Settings.models.book.max_name}
  validates :num_of_pages, presence: true, numericality: {only_integer: true}
  validates :image, presence: true
  validates :content, presence: true
  validates :quantity, presence: true, numericality: {only_integer: true}
  validates :price, presence: true, numericality: {only_integer: true}

  def writers
    authors.map(&:name).join(", ")
  end
end
