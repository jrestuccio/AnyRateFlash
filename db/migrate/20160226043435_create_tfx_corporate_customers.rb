class CreateTfxCorporateCustomers < ActiveRecord::Migration
  def change
    create_table :tfx_corporate_customers do |t|
      t.integer :C_CustomerID
      t.string :C_LoginCode
      t.integer :C_CustomerChainID
      t.string :C_CustomerName
      t.string :Address1
      t.string :Address2
      t.string :City
      t.string :State
      t.string :Zip
      t.string :Phone

      t.timestamps null: false
    end
  end
end
