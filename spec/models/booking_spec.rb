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

require 'rails_helper'

RSpec.describe Booking, type: :model do
  it { should validate_presence_of :checkin}
  it { should validate_presence_of :checkout}
  it { should validate_presence_of :occupancy}
  it { should belong_to :user}
  it { should belong_to :house}
end
