class CreateParty < ActiveRecord::Migration[5.2]
  def change
    create_table :parties do |t|
      t.string :movie_id
      t.string :movie_title
      t.date :date
      t.time :start_time
      t.integer :movie_runtime
      t.integer :duration
      t.references :user, foreign_key: true
    end
  end
end
