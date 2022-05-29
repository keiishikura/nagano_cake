class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      
      t.integer :customer_id
      t.string :name
      t.string :postal_code
      t.string :address

      t.timestamps null: false, default: ->{ "CURRENT_TIMESTAMP" }
    end
  end
end
