class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :nickname, presence: true
         validates :last_name, presence: true
         validates :first_name, presence: true 
         validates :last_kana, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/  }
         validates :first_kana, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/  }
         validates :birth_day, presence: true

end
