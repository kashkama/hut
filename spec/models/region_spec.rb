require 'rails_helper'

RSpec.describe Region, type: :model do
  it {should have_many :houses}
  it {should validate_presence_of :name}
end
