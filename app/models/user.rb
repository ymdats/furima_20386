class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :email, uniqueness: { case_sensitive: true }, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/ }
    validates :password, format: { with: /\A(?=.*?[a-zA-Z])(?=.*?\d)[a-zA-Z\d]{6,}\z/ }
    validates :family_name, :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ }
    validates :family_kana, :first_kana, format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :birthday
  end
end
