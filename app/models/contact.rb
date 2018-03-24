# Class level comment for Contact model
class Contact < ApplicationRecord
  validates :name, :position, :email, presence: true
end
