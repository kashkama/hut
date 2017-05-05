# == Schema Information
#
# Table name: bookings
#
#  id         :integer          not null, primary key
#  checkin    :date
#  checkout   :date
#  occupancy  :integer
#  user_id    :integer
#  house_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :house
  validates :checkin, presence: true
  validates :checkout, presence: true
  validates :occupancy, presence: true
end
