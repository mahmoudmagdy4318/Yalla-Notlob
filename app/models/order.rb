class Order < ApplicationRecord
    enum status: [:waiting, :finished]
    enum meal: [:breakfast, :lunch, :dinner]
    has_many :users
    has_many :orderDetails
    has_many :notifications
    has_one_attached :menu
end
