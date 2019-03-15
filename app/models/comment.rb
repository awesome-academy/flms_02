class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validates :content, presence: true

  scope :newest, ->{order created_at: :desc}

  delegate :name, to: :user, prefix: :user
end
