class Trip < ApplicationRecord
  belongs_to :user
  validate :start_at, :end_at, :title, presence: true
end
