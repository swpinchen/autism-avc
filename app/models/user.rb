class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :reviews, through: :items
  has_many :parents, class_name: "User", foreign_key: :parent_id, dependent: :destroy

  belongs_to :parent, class_name: "User", foreign_key: :parent_id, optional: true

  # has_settings :voice, :pitch, :rate
  has_settings do |s|
    s.key :stt, defaults: { voice: 'English', pitch: 5, rate: 5 }
  end

  def parent?
    !parent.nil?
  end

end
