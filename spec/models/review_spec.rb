# == Schema Information
#
# Table name: reviews
#
#  id         :integer          not null, primary key
#  comment    :text
#  user_id    :integer
#  house_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Review, type: :model do
    it {should validate_presence_of :comment}
    it {should belong_to :user}
    it {should belong_to :house}
end
