class ChangeContestPrize < ActiveRecord::Migration
  def change
    change_column :contests, :prize, :decimal, :precision => 8, :scale => 2
  end
end
