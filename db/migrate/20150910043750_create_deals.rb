class CreateDeals < ActiveRecord::Migration
  def change
    create_table :deals do |t|
      t.string :name
      t.string :name2
      t.string :details
      t.integer :price
      t.integer :value
      t.belongs_to :business
      t.timestamps null: false
    end
  end
end
