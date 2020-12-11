class Meeting < ApplicationRecord
  has_many :users, -> { distinct }, through: :records, dependent: :destroy
  has_many :records, dependent: :destroy
end
