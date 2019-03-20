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

  validates :name, presence: true, uniqueness: {case_sensitive: false},
    length: {maximum: Settings.models.book.max_name}
  validates :num_of_pages, presence: true, numericality: {only_integer: true}
  validates :image, presence: true
  validates :content, presence: true
  validates :quantity, presence: true, numericality: {only_integer: true}
  validates :price, presence: true, numericality: {only_integer: true}

  scope :newest, ->{order created_at: :desc}
  scope :by_category, ->category_id{where(category_id: category_id)}

  accepts_nested_attributes_for :author_books

  delegate :name, to: :category, prefix: :category
  delegate :name, to: :publisher, prefix: :publisher

  def writers
    authors.map(&:name).join(", ")
  end

  def update_avg_rating
    update_attribute :avg_rating, ratings.sum(:number_rating)/(ratings.count)
  end

  def comments_newest
    comments.newest
  end
end
