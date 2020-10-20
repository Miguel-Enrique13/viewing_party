class CreateInvitation < ActiveRecord::Migration[5.2]
  def change
    create_table :invitations do |t|
      t.references :user, foreign_key: true
      t.references :party, foreign_key: true
    end
  end
end
