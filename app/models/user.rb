class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :orders

  validates :email, presence: true, uniqueness: true 
  validates :email, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: "は@を含む必要があります" }
  validates :encrypted_password, presence: true
  validates :password_confirmation, presence: true
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :nickname, presence: true
  validates :birthday, presence: true
  
end
