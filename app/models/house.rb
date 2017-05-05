# == Schema Information
#
# Table name: houses
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  telephone   :integer
#  location    :text
#  street      :string
#  bedrooms    :string
#  minimumstay :string
#  rules       :text
#  ammenities  :text
#  price       :integer
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class House < ApplicationRecord
  geocoded_by :location
  after_validation :geocode
  ratyrate_rateable "experience"
  has_many :bookings, dependent: :destroy
  has_many :reviews, dependent: :destroy
  belongs_to :user
  belongs_to :region
  mount_uploaders :images, ImageUploader
  validates :name, presence: true
  validates :description, presence: true
  validates :telephone, presence: true
  validates :location, presence: true
  validates :street, presence: true
  validates :bedrooms, presence: true
  validates :minimumstay, presence: true
  validates :rules, presence: true
  validates :ammenities, presence: true
  validates :price, presence: true

  # searching params
  def self.search(search)
    where("name ILIKE ? OR location ILIKE ?", "%#{search}%", "%#{search}%")
  end
end
