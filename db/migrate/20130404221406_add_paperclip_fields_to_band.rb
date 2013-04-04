class AddPaperclipFieldsToBand < ActiveRecord::Migration
  def change
    add_column :bands, :image_file_name,    :string
    add_column :bands, :image_content_type, :string
    add_column :bands, :image_file_size,    :integer
    add_column :bands, :image_updated_at,   :datetime
  end
end
