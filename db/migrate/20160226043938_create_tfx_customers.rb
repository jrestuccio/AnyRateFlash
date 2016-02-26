class CreateTfxCustomers < ActiveRecord::Migration
  def change
    create_table :tfx_customers do |t|
      t.integer :CustoemrID
      t.string :LoginCode
      t.integer :CustomerChainID
      t.string :CustomerName
      t.integer :CustomerSiteID
      t.string :Address1
      t.string :Address2
      t.string :City
      t.string :State
      t.string :Zip
      t.string :Phone
      t.integer :HostHotelID
      t.integer :C_CustomerID
      t.string :CountryCode

      t.timestamps null: false
    end
  end
end
