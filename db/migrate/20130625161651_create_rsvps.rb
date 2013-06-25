class CreateRsvps < ActiveRecord::Migration
  def change
    create_table :rsvps do |t|
      t.string :status
      t.string :printed
      t.integer :guest_id

      t.timestamps
    end
  end
end
