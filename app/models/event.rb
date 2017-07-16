class Event < ApplicationRecord
  has_many :event_categories
  has_many :categories, through: :event_categories
  has_many :user_events
  has_many :users, through: :user_events
  has_many :comments
  validates :title, presence: true
  validates :title, uniqueness: true
  validates :description, presence: true
  validates :description, length: {maximum: 5000}
  acts_as_messageable
  
  has_attached_file :avatar,
                    :styles => { :medium => "150x150>", :thumb => "44x44#" },
                    :default_url => "/images/default.png"

  validates_attachment :avatar, :presence => true,
                       :content_type => { :content_type => ["image/jpeg", "image/gif", "image/png"] },
                       :size => { :in => 0..1000.kilobytes }

end
