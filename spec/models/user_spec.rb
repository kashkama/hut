# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  admin                  :boolean
#  name                   :string
#  telephone              :integer
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default("0"), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  avatar_file_name       :string
#  avatar_content_type    :string
#  avatar_file_size       :integer
#  avatar_updated_at      :datetime
#  provider               :string
#  uid                    :string
#

require 'rails_helper'

RSpec.describe User, type: :model do

#   let (:user) {build(:user)}
  
  
  it { should validate_presence_of :name }
  it { should validate_uniqueness_of :name }
  it { should validate_length_of(:name).is_at_least(3).is_at_most(15)}


  it { should validate_presence_of :email }
#   it { should validate_uniqueness_of :email }


  it { should validate_confirmation_of :password }
  it { should validate_length_of(:password).is_at_least(6).is_at_most(20)}

#   it "returns email as downcased" do
#     user = create(:user, upcased: true)
#     expect(user.email).to eq(user.email.downcase)
#   end
end

