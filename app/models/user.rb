class User < ApplicationRecord
  before_save :downcase_email

  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :requests, dependent: :destroy
  has_many :ratings, dependent: :destroy
  has_many :follows, dependent: :destroy

  validates :name, presence: true,
    length: {maximum: Settings.models.user.max_name}
  validates :address, presence: true
  validates :phone, presence: true,
    length: {maximum: Settings.models.user.max_phone}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
    length: {maximum: Settings.models.user.max_email},
    format: {with: VALID_EMAIL_REGEX},
    uniqueness: {case_sensitive: false}
  validates :password, presence: true,
    length: {minimum: Settings.models.user.min_pass}, allow_nil: true

  enum role: {user: 0, admin: 1}

  has_secure_password

  scope :alphabet, ->{order name: :asc}

  private

  def downcase_email
    self.email = email.downcase
  end
end
