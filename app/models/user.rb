class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :password, format: { with: /\A[a-z0-9]+\z/}
         validates :name, presence: true
         validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/}
         validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/}
         validates :last_furigana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/}
         validates :first_furigana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/}
         validates :birth_date, presence: true
end
