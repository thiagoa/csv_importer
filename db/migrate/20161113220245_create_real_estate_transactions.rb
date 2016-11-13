class CreateRealEstateTransactions < ActiveRecord::Migration[5.0]
  def change
    create_table :real_estate_transactions do |t|
      t.string :street, null: false, default: ''
      t.string :city, null: false, default: ''
      t.string :zip, null: false, default: ''
      t.string :state, null: false, default: ''
      t.integer :beds, null: false, default: 0
      t.integer :baths, null: false, default: 0
      t.string :type, null: false, default: ''
      t.integer :sq_ft, null: false, default: 0
      t.datetime :sale_date
      t.integer :price, null: false, default: 0
      t.decimal :latitude, null: false, default: 0
      t.decimal :longitude, null: false, default: 0
    end
  end
end
