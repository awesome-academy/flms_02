class Publisher < ApplicationRecord
  has_many :books, dependent: :destroy

  validates :name, presence: true,
    length: {maximum: Settings.models.publisher.max_name}
  validates :phone, presence: true,
    length: {maximum: Settings.models.publisher.max_phone}
  validates :address, presence: true

  scope :alphabet, ->{order name: :asc}
end
