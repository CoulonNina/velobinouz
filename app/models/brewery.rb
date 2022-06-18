class Brewery < ApplicationRecord
  has_many :reviews
  validate :name, :address, :ZIP_codes, :city, :open_at, :closed_at, presence: true
  validate :happened_at_is_valid_datetime
  
  def happened_at_is_valid_datetime
    errors.add(:open_at, 'must be a valid datetime') if ((DateTime.parse(open_at) rescue ArgumentError) == ArgumentError)
  end

end
