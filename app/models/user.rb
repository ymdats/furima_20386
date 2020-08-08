class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :email, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/, message: 'メールアドレスを入れてください'}
    validates :password, format: { with: /[a-z\d]{6,}/, message: '6文字以上の半角英数字混合で入力してください'}
    validates :family_name, :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: '全角（漢字・ひらがな・カタカナ）で入力してください' }
    validates :family_kana, :first_kana, format: { with: /\A[ァ-ン]+\z/, message: '全角（カタカナ）で入力してください' }
    validates :birthday
  end
end
