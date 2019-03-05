class Request < ApplicationRecord
  belongs_to :book
  belongs_to :user

  validates :from_date, presence: true, date: {before_or_equal_to: :to_date}
  validates :quantity, presence: true, numericality: {only_integer: true}

  enum status: {not_approved: 0, approved: 1, reject: 2}
end
