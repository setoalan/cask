class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  validates :name, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :breweries, dependent: :destroy
  has_many :reservations, dependent: :destroy
  has_many :stars, dependent: :destroy
  has_many :favorites, through: :stars, source: :brewery
end
