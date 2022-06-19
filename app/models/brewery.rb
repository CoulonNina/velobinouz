class Brewery < ApplicationRecord
  has_many :reviews
  validates :name, :address, :ZIP_codes, :city, :open_at, :closed_at, presence: true
end
