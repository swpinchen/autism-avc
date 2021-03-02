class Item < ApplicationRecord
  belongs_to :user
  has_many :reviews

  validates :title, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :recurring, default: false
  validates :completed, default: false

end
