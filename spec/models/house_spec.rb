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


require 'rails_helper'

RSpec.describe House, type: :model do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
    it {should validate_presence_of :telephone}
    it {should validate_presence_of :location}
    it {should validate_presence_of :street}
    it {should validate_presence_of :bedrooms}
    it {should validate_presence_of :minimumstay}
    it {should validate_presence_of :ammenities}
    it {should validate_presence_of :price}
    it {should belong_to :user}
    it {should belong_to :region}
    it {should have_many :bookings}
    it {should have_many :reviews}
end
