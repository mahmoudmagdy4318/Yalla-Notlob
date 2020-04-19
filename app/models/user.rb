class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         
         :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

  def self.create_from_provider_data(provider_data)
    where(provider: provider_data.provider, uid: provider_data.uid).first_or_create do | user |
      user.provider = provider_data.provider
      user.uid = provider_data.uid
      user.email = provider_data.info.email
      user.name = provider_data.info.name
      user.password = Devise.friendly_token[0, 20]
    end
  end

  validates :name, presence: true,
                    length: { minimum: 5 }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP } ,uniqueness: true
  validates :password,presence: true, length: { in: 6..20 }
  # validates :password_confirmation,presence: true
  has_one_attached :image

  has_and_belongs_to_many :friendships,
      class_name: "User", 
      join_table:  :friendships, 
      foreign_key: :user_id, 
      association_foreign_key: :friend_user_id

  has_and_belongs_to_many :projects   
  has_and_belongs_to_many :orders 

  has_many :notifications

end
