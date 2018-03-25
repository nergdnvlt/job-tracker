class Job < ApplicationRecord
  validates :title, :level_of_interest, :city, presence: true
  belongs_to :company
  belongs_to :category, optional: true
  has_many :comments, dependent: :destroy

  def self.group_location
    cities = distinct.order(:city).pluck(:city)

    cities.map{ |city| [city, where(city: city).size] }
  end
end
