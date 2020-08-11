class Event < ApplicationRecord
  # default_scope -> { order(start_date: :asc) }
  belongs_to :organizer, class_name: 'User'
  has_many :attendances, dependent: :destroy
  has_many :attendees, through: :attendances, class_name: 'User'

  has_many :event_tags
  has_many :tags, through: :event_tags
  belongs_to :category

  validates :title, presence: true, length: {in: 5..140}
  validates :start_date, presence: true
  # validates :start_at, presence: true
  validates :duration, presence: true, format: { with: /\A\d+\z/, message: "Duration in munutes must be a valid number" }
  validates :description, presence: true, length: {in: 20..1000}
  validates :price, presence: true, format: { with: /\A\d+\z/, message: "please enter a valid number" }
  validates :location, presence: true
  validates :category_id, presence: true

  validate  :picture_size
  validate :start_date_must_be_start_from_today
  validate :past_date_not_changed
  
  
  before_save :auto_end_date
  before_save :normalize_duration


  private
  # Validates the size of an uploaded picture.
  def picture_size
    # if self.img_url.size > 5.megabytes
    #   errors.add(:img_url, "should be less than 5MB")
    # end
  end

  def start_date_must_be_start_from_today
    if self.start_date.to_date < Time.now.to_date 
      return errors.add(:start_date, "Start date must be from today!")
    end
  end
  def start_date_must_be_before_end_date
    valid = self.start_date && self.end_date && self.start_date < self.end_date
    errors.add(:start_date, "Must before end date") unless valid
  end
  def past_date_not_changed
    if start_date_changed? && self.persisted?
      errors.add(:start_date, "Can not modify the past date")
    end
  end

  def auto_end_date
    if self.end_date.nil?
      self.end_date = self.start_date
    end
  end

  # Round durantion 5 minutes
  def normalize_duration
      n = self.duration
      if n % 5 != 0 
        rounded = n.round(-1)
        self.duration = rounded > n ? rounded : rounded + 5
      end
  end

end
