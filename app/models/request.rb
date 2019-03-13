class Request < ApplicationRecord
  belongs_to :book
  belongs_to :user

  validates :quantity, presence: true, numericality: {only_integer: true}

  enum status: {not_approved: 0, approved: 1, reject: 2}
end
