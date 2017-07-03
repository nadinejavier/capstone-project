class Category < ApplicationRecord
  has_many :event_categories
  has_many :events, through: :event_categories
  validates :title, presence: true, uniqueness: true
end
