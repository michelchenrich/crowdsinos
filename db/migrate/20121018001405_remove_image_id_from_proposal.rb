class RemoveImageIdFromProposal < ActiveRecord::Migration
  def change
    remove_column :proposals, :image_id
  end
end
