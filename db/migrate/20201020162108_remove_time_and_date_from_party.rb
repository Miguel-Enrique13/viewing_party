class RemoveTimeAndDateFromParty < ActiveRecord::Migration[5.2]
  def change
    remove_column :parties, :start_time, :time
    remove_column :parties, :date, :date
  end
end
