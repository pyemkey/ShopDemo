class CreateListing < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :name
      t.text :description
      t.decimal :price, precision: 8, scale: 2
    end
  end
end
