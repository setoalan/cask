class Reservation < ActiveRecord::Base
  validates :email, presence: true
  validates :request_date_time, presence: true
  validates :message, presence: true
  belongs_to :brewery
  belongs_to :user
end
