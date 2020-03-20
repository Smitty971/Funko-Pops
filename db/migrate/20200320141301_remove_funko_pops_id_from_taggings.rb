class RemoveFunkoPopsIdFromTaggings < ActiveRecord::Migration[6.0]
  def change
    remove_column :taggings, :funko_pops_id, :integer
  end
end
