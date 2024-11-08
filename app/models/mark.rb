class Mark < ApplicationRecord
    validates :name, :url, :category, :description, :user_id, presence: true
    validates :url, uniqueness: true
end
