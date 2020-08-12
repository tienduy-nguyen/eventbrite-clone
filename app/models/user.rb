class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :organizers, dependent: :destroy
  has_many :events, through: :organizers,  dependent: :destroy
  has_many :attendances, foreign_key: 'attendee_id', class_name: 'User'
  has_many :events, foreign_key: 'attendee_id', class_name: 'User', through: :attendances

  validates :email, 
  presence:true , 
  uniqueness:{case_sensitive: false}, 
  format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "email adress please" }

  validates :password, length: {minimum: 6}, presence: true, on: :create
  validates :password_confirmation, length: {minimum: 6}, presence: true, on: :create
  validates :password, length: {minimum: 6}, presence: true, on: :update, if: :encrypted_password_changed?
  validates :password_confirmation, length: {minimum: 6}, presence: true, on: :update, if: :encrypted_password_changed?

  before_save :normalize_name
  before_save :downcase_email
  before_save :get_full_name

  # Send email
  after_create :create_default_organizer
  after_create :welcome_send



  # Private method --------------------------------------
  private
  def create_default_organizer
    Organizer.create(name: self.full_name,  user: self)
  end
  
  # Send email with sendgrid
  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end
  
  # Downcase email before being saved
  def downcase_email
    self.email = email.strip.downcase
  end

  def normalize_name
    if !self.first_name.nil?
      self.first_name = self.first_name.downcase.capitalize
    end
    if !self.last_name.nil?
      self.last_name = self.last_name.downcase.capitalize
    end
  end 
  def get_full_name
    if self.first_name.nil? && self.last_name.nil?
        self.full_name = self.email.split('@')[0]
    else
      self.full_name = "#{self.first_name.capitalize unless self.first_name.nil?} #{self.last_name.capitalize unless self.last_name.nil?}"
    end
  end
  def set_sex
    if self.sex.nil?
      self.sex = 'other'
    end
  end

  def blank_password?
    self.password = nil if self.password.blank?
  end

  
end
