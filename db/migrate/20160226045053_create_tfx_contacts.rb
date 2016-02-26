class CreateTfxContacts < ActiveRecord::Migration
  def change
    create_table :tfx_contacts do |t|
      t.string :FirstName
      t.string :LastName
      t.string :Email
      t.string :UserID
      t.string :Password
      t.string :Phone
      t.datetime :Expires

      t.timestamps null: false
    end
  end
end
