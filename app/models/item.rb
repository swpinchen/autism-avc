class Item < ApplicationRecord
  belongs_to :user
  has_many :reviews
  has_one_attached :photo

  validates :title, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :recurring, default: false
  validates :completed, default: false

  include PgSearch::Model
  pg_search_scope :search_by_title, against: [:title], using: {
    tsearch: { prefix: true } # <-- now `superman batm` will return something!
  }
end
