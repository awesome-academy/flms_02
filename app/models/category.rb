class Category < ApplicationRecord
  has_many :books, dependent: :destroy
  validates :name, presence: true,
    length: {maximum: Settings.models.category.max_name}
  scope :alphabet, ->{order name: :asc}
end
