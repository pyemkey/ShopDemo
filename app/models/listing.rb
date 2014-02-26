class Listing < ActiveRecord::Base
	has_attached_file :listing_image, 
    styles: { medium: "200x200>", thumb: "100x100"},
    storage: :dropbox,
    dropbox_credentials: Rails.root.join("config/dropbox.yml")
  belongs_to :user

	validates_presence_of :name, :description, :price, :listing_image
	validates :description, length: { maximum: 255 }
	validates :price, numericality: true
  validates_attachment_content_type :listing_image, content_type: ['image/jpg', 'image/jpeg']

end