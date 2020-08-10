class EventTag < ApplicationRecord
  belongs_to :event
  belongs_to :tag

  validates :tag_id,presence: true

  validates :event_id, presence: true
end
