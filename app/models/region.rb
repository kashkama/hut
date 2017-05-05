class Region < ApplicationRecord
    has_attached_file :image, styles: { large: "600x600>", medium: "300x300>", thumb: "150x150#"}
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
    has_many :houses, dependent: :destroy
    validates :name, presence: true
end
