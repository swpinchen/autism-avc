class Item < ApplicationRecord
  belongs_to :user
  belongs_to :item

  validates :title, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :recurring, presence: true, default: false
  validates :completed, presence: true, default: false

end
