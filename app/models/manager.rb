class Manager < ApplicationRecord
    has_many :employee

    validates :name, presence: true
end
