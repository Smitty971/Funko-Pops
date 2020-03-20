class CreateTaggings < ActiveRecord::Migration[6.0]
  def change
    create_table :taggings do |t|
     t.references :tag
     t.references :funko_pops
     t.timestamps
    end
  end
end
