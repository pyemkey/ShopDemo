require 'spec_helper'

 # factory :attachment do
 #   supporting_documentation_file_name { 'test.jpg' }
 #   supporting_documentation_content_type { 'image/jpg' }
 #   supporting_documentation_file_size { 1024 }
 # end
describe Listing do
  it "is valid with a name, description, price, listing_image" do
    listing = Listing.new(
      name: 'Math',
      description: 'a'*66,
      price: 24,
      listing_image: File.new("#{Rails.root}/spec/factories/rails.png"))
    expect(listing).to be_valid
  end
  it "is invalid without name" do
    listing = Listing.new(name: nil)
    expect(listing).to have(1).errors_on(:name)
  end
  it "is invalid without description" do
    listing = Listing.new(description: nil)
    expect(listing).to have(1).errors_on(:description)
  end
  it "is invalid without price" do
    listing = Listing.new(price: nil)
    expect(listing).to have(2).errors_on(:price)
  end
  it "is invalid without listing_image"
end