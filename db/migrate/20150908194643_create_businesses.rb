class CreateBusinesses < ActiveRecord::Migration
  def change
    create_table :businesses do |t|
      t.string :business_name
      t.string :address
      t.string :contact_info
      t.string :category
      t.string :introduction
      t.string :website

      t.timestamps null: false
    end
  end
end
