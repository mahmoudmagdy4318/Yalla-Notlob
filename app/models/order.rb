class Order < ApplicationRecord
    enum status: [:waiting, :finished]
    enum meal: [:breakfast, :lunch, :dinner]
    has_many :users
    has_many :orderDetails
end
