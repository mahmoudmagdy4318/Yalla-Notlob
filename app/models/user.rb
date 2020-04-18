class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true,
                    length: { minimum: 5 }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP } ,uniqueness: true
  validates :password,presence: true, length: { in: 6..20 }
  validates :password_confirmation,presence: true
  has_one_attached :image
end
