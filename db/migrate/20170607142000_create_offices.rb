class CreateOffices < ActiveRecord::Migration[5.0]
  def change
    create_table :offices do |t|
      t.string :name
      t.string :neighborhood
      t.timestamps null: false
    end
  end
end
