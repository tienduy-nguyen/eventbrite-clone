class Attendance < ApplicationRecord
  belongs_to :attendee, class_name: 'User'
  belongs_to :event, class_name: 'Event'
  validates :attendee, presence: true
  validates :event, presence: true
  validates :stripe_customer_id, presence: true, uniqueness: true
end
