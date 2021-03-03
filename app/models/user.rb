class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :reviews, through: :items

  # has_settings :voice, :pitch, :rate
  has_settings do |s|
    s.key :stt, defaults: { voice: 'English', pitch: 5, rate: 5 }
  end
end
