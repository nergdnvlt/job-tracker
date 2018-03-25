class Company < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :jobs, dependent: :destroy
  has_many :contacts, dependent: :destroy

  def self.top_interests
    joins(:jobs)
    .group(:id)
    .order("avg(level_of_interest) DESC")
    .limit(3)
  end

  def average_interest
    jobs.average(:level_of_interest)
  end
end
