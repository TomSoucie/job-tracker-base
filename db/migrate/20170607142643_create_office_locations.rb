class CreateOfficeLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :office_locations do |t|
      t.integer :office_id
      t.integer :company_id
      t.timestamps null: false
    end
  end
end
