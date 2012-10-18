class UpdateContests < ActiveRecord::Migration
  def change
    add_column :contests, :canceled, :boolean
    remove_column :contests, :winner_id
    add_column :contests, :winning_proposal_id, :integer
  end
end
