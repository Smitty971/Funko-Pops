class Addpaperclipfieldstofunkopops < ActiveRecord::Migration[6.0]
  def change
    add_column :funko_pops, :image_file_name, :string
    add_column :funko_pops, :image_content_type, :string
    add_column :funko_pops, :image_file_size, :integer
    add_column :funko_pops, :image_updated_at, :datetime
  end
end
