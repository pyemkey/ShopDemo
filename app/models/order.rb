class Order < ActiveRecord::Base
  belongs_to :listing
  belongs_to :user

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