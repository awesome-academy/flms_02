class Request < ApplicationRecord
  belongs_to :book
  belongs_to :user

  validates :quantity, presence: true, numericality: {only_integer: true}
  validates :from_date, presence: true
  validates :to_date, presence: true
  validate :to_date_after_from_date

  scope :newest, ->{order created_at: :desc}

  enum status: {not_approved: 0, approved: 1, reject: 2}

  delegate :name, to: :book, prefix: :book

  def total
    (to_date - from_date).to_i * quantity * book.price * Settings.unit_price
  end

  private

  def to_date_after_from_date
    return if to_date.blank? || from_date.blank? || to_date > from_date
    errors.add :to_date, I18n.t("invalid_date")
  end
end
