class CreateStores < ActiveRecord::Migration[6.0]
  def change
    create_table :stores do |t|
      t.string :title
      t.references :funko_pops

      t.timestamps
    end
  end
end
