class CreateCars < ActiveRecord::Migration[6.0]
  def change
    create_table :cars do |t|
      t.string :name
      t.text :description
      t.integer :year
      t.string :model
      t.string :image
      t.string :location
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
