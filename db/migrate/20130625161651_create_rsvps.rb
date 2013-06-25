class CreateRsvps < ActiveRecord::Migration
  def change
    create_table :rsvps do |t|
      t.string :status
      t.string :first_last
      t.string :printed

      t.timestamps
    end
  end
end
