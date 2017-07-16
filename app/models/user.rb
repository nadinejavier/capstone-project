class User < ApplicationRecord
  has_secure_password
  has_many :user_events
  has_many :events, through: :user_events
  has_many :comments
  acts_as_messageable
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :first_name, presence: true
  validates :first_name, uniqueness: true
  validates :bio, presence: true
  validates :bio, length: {maximum: 5000}
  has_attached_file :avatar,
                    :styles => { :medium => "150x150>", :thumb => "44x44#" },
                    :default_url => "/images/default.png"

  validates_attachment :avatar, :presence => true,
                       :content_type => { :content_type => ["image/jpeg", "image/gif", "image/png"] },
                       :size => { :in => 0..1000.kilobytes }


  def mailboxer_email(object)
    nil
  end

  def full_name
    self.first_name + " " + self.last_name
  end


end
