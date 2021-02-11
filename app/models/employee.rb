class Employee < ApplicationRecord
  before_validation :trim_data
  after_validation :normalize_name, on: [ :create, :update ]
  after_save :send_welcome_email
  before_destroy :send_goodbye_email
  after_destroy :remove_user_data
  after_find :view_profile_email

  validates :name, length: { minimum: 2, maximum: 30 }, presence: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }, presence: true
  validates :dob, presence: true
  validates :mobile, numericality: true, length: { is: 10 }, presence: true
  validates :designation, presence: true
  validates :salary, numericality: true, presence: true

  def trim_data
    name.strip!
    email.strip!
    mobile.strip!
    designation.strip!
  end

  def normalize_name
    self.name = name.downcase.titleize
  end

  def send_welcome_email
    Rails.logger.info "Welcome email sent to #{email}"
  end

  def send_goodbye_email
    Rails.logger.info "Goodbye email sent to #{email}"
  end

  def remove_user_data
    Rails.logger.info "User data deleted with id #{id}"
  end

  def view_profile_email
    Rails.logger.info "\'Someone Viewed Your Profile\' email sent to #{email}"
  end

  private :trim_data, :normalize_name
end
