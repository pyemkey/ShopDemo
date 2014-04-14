# == Schema Information
#
# Table name: orders
#
#  id         :integer          not null, primary key
#  address    :string(255)
#  state      :string(255)
#  city       :string(255)
#  user_id    :integer
#  listing_id :integer
#  created_at :datetime
#  updated_at :datetime
#

class Order < ActiveRecord::Base
  belongs_to :listing
  belongs_to :user

  scope :received_by, -> (current_user) { where("listing_id in (?)", current_user.listings.ids) }
  attr_accessor :stripe_token
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
