class Event < ApplicationRecord
  has_many :event_categories
  has_many :categories, through: :event_categories
  has_many :user_events
  has_many :users, through: :user_events
  validates :title, presence: true
  validates :title, uniqueness: true
  validates :description, presence: true
  validates :description, length: {maximum: 500}
end
