class Manager < ApplicationRecord
  has_many :employee

  before_save :trim_data, :normalize_name

  validates :name, length: { minimum: 2, maximum: 30 }, presence: true

  def trim_data
    name.strip!
  end

  def normalize_name
    self.name = name.downcase.titleize
  end
end
