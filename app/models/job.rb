class Job < ApplicationRecord
  validates :title, :level_of_interest, :city, presence: true
  belongs_to :company
  belongs_to :category, optional: true
  has_many :comments, dependent: :destroy

  def self.group_location
    order(:city)
      .distinct(:city)
      .group(:city)
      .count
  end

  def self.group_interests
    [where(level_of_interest: 0..19),
     where(level_of_interest: 20..39),
     where(level_of_interest: 40..59),
     where(level_of_interest: 60..79),
     where(level_of_interest: 80..100)]
  end
end
