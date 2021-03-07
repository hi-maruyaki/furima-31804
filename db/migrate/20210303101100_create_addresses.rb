class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.integer :postcode,     null: false
      t.integer :prefecture,      null: false
      t.string :city,             null: false         
      t.string :address,      null: false
      t.string :building_name
      t.string :tellphone,              null: false
      t.references :order,     foreign_key: true
      t.timestamps
    end
  end
end
