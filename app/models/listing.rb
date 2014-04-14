# == Schema Information
#
# Table name: listings
#
#  id                         :integer          not null, primary key
#  name                       :string(255)
#  description                :text
#  price                      :decimal(8, 2)
#  listing_image_file_name    :string(255)
#  listing_image_content_type :string(255)
#  listing_image_file_size    :integer
#  listing_image_updated_at   :datetime
#  user_id                    :integer
#  created_at                 :datetime
#  updated_at                 :datetime
#

class Listing < ActiveRecord::Base
	has_attached_file :listing_image, 
    styles: { medium: "200x200>", thumb: "100x100"},
    storage: :dropbox,
    dropbox_credentials: Rails.root.join("config/dropbox.yml")
  belongs_to :user
  has_many :orders
  
	validates_presence_of :name, :description, :price, :listing_image
	validates :description, length: { maximum: 255 }
	validates :price, numericality: true
  validates_attachment_content_type :listing_image, content_type: ['image/jpg', 'image/jpeg','image/png']

  def thumb
    listing_image.url(:thumb)
  end

  def medium_image
    listing_image.url(:medium)
  end
end
