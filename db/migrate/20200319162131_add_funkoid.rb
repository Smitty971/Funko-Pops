class AddFunkoid < ActiveRecord::Migration[6.0]
  def change
    add_column :comments, :funko_pop_id, :integer
  end
end
