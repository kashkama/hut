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

class User < ApplicationRecord
  ratyrate_rater
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "30x30#", large: "500x500>"}
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
        #  set all auth providers by callback defined in callbacks_controlletr.rb
         :omniauthable, omniauth_providers: [:google_oauth2, :facebook,]
  has_many :houses, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :bookings, dependent: :destroy

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

    validates :name, presence: true, uniqueness: true, length: { in: 3..15 }
    # validates :email, presence: true, format: {with: VALID_EMAIL_REGEX}, uniqueness: true
    validates :password, confirmation: true
    validates_length_of :password, in: 6..20, on: :create


# gather your necessary fields from provider to use it on current_user
  def self.from_omniauth(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.name = auth.info.name
        user.avatar = auth.info.avatar
        user.email = auth.info.email
        # user.image = auth.info.image
        user.password = Devise.friendly_token[0,20]
      end
  end
end
