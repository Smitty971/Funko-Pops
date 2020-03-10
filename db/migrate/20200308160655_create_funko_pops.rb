class CreateFunkoPops < ActiveRecord::Migration[6.0]
  def change
    create_table :funko_pops do |t|
      t.string :title
      t.integer :price
      t.string :series
      t.text :description
      t.references :user 

      t.timestamps
    end
  end
end
