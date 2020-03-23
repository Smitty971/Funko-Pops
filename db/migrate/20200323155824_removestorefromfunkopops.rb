class Removestorefromfunkopops < ActiveRecord::Migration[6.0]
  def change
    remove_column :funko_pops, :store, :integer
  end
end
