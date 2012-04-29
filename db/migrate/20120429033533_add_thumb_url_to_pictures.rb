class AddThumbUrlToPictures < ActiveRecord::Migration
  def change
    add_column :pictures, :thumb_url, :string
  end
end
