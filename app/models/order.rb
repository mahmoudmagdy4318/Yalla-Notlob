class Order < ApplicationRecord
    enum status: [:waiting, :finished]
    enum meal: [:breakfast, :lunch, :dinner]
    has_and_belongs_to_many :users
    has_many :orderDetails
end
