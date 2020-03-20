class AddFunkoPopIdToTaggings < ActiveRecord::Migration[6.0]
  def change
    add_column :taggings, :funko_pop_id, :integer
  end
end
