class Order < ApplicationRecord
    enum status: [:waiting, :finished]
    enum meal: [:breakfast, :lunch, :dinner]
    belongs_to :users ,class_name: "User", foreign_key: "owner"
    has_many :orderDetails
    has_many :notifications
end
