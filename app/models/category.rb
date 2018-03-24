class Category < ApplicationRecord
  validates :name, presence: true
  has_many :jobs, dependent: :destroy
end