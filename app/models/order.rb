class Order < ActiveRecord::Base
  belongs_to :listing
  belongs_to :user

  scope :received_by, -> (current_user) { where("listing_id in (?)", current_user.listings.ids) }

  delegate :name,
           :price,
           :thumb,
           to: :listing,
           prefix: :product

  def user_name
    user.name
  end

  def sold_date
    created_at.strftime("%B %d, %Y")
  end
end