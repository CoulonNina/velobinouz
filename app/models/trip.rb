class Trip < ApplicationRecord
  belongs_to :user
  validates :start_at, :end_at, :title, presence: true
end
