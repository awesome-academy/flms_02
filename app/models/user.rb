class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
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

  scope :alphabet, ->{order name: :asc}
  scope :by_role, ->role{where(role: role)}

  private

  def downcase_email
    self.email = email.downcase
  end
end
