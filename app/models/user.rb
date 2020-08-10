class User < ApplicationRecord
  has_many :events, foreign_key: 'organizer_id', class_name: 'User',  dependent: :destroy
  has_many :attendances, foreign_key: 'attendee_id', class_name: 'User'
  has_many :events, foreign_key: 'attendee_id', class_name: 'User', through: :attendances

  validates :email, 
  presence:true , 
  uniqueness:{case_sensitive: false}, 
  format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "email adress please" }

  # validates :password, length: {minimum: 6}, presence: true, on: :create
  # validates :password_confirmation, length: {minimum: 6}, presence: true, on: :create
  # validates :password, length: {minimum: 6}, presence: true, on: :update, if: :encrypted_password_changed?
  # validates :password_confirmation, length: {minimum: 6}, presence: true, on: :update, if: :encrypted_password_changed?

  before_save :normalize_name
  before_save :downcase_email
  before_save :get_full_name

  private

  # Downcase email before being saved
  def downcase_email
    self.email = email.strip.downcase
  end

  def normalize_name
    if self.first_name.nil?
      self.first_name = self.first_name.downcase.capitalize
    end
    if self.last_name.nil?
      self.last_name = self.last_name.downcase.capitalize
    end
  end 
  def get_full_name
    if self.first_name.nil? && self.last_name.nill?
        self.full_name = self.email.split('@')[0]
    else
      self.full_name = "#{self.first_name.capitalize unless self.first_name.nil?} #{self.last_name.capitalize unless self.last_name.nil?}"
    end
  end

  def blank_password?
    self.password = nil if self.password.blank?
  end
end
