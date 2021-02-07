class Employee < ApplicationRecord
  validates :name, length: { minimum: 2, maximum: 30 }, presence: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }, presence: true
  validates :dob, presence: true
  validates :mobile, numericality: true, length: { is: 10 }, presence: true
  validates :designation, presence: true
  validates :salary, numericality: true, presence: true
end
