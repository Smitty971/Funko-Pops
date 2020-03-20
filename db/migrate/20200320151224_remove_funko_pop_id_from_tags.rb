class RemoveFunkoPopIdFromTags < ActiveRecord::Migration[6.0]
  def change
    remove_column :tags, :funko_pop_id, :integer
  end
end
