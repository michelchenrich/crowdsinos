class AddImageToProposal < ActiveRecord::Migration
  def change 
    add_column :proposals, :image_file_name, :string
    add_column :proposals, :image_content_type, :string
    add_column :proposals, :image_file_size, :integer
    add_column :proposals, :image_updated_at, :datetime
  end
end
