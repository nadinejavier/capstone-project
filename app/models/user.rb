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


  def mailboxer_email(object)
    nil
  end

  def full_name
    self.first_name + " " + self.last_name
  end


end
