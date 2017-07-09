class User < ApplicationRecord
  has_secure_password
  has_many :user_events
  has_many :events, through: :user_events
  acts_as_messageable

  def mailboxer_email(object)
    nil
  end

  def full_name
    self.first_name + " " + self.last_name
  end
end
