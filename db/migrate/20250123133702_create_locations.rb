class CreateLocations < ActiveRecord::Migration[8.0]
  def change
    create_table :locations do |t|
      t.string :city
      t.string :address

      t.timestamps
    end
  end
end
