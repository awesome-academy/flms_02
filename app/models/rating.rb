class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :book
  validates :number_rating, presence: true, numericality: {only_integer: true}
end
