class Brewery < ApplicationRecord
  has_many :reviews
  validates :name, :address, :zip, :city, presence: true
end
