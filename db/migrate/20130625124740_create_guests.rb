class CreateGuests < ActiveRecord::Migration
  def change
    create_table :guests do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :company
      t.string :attending_with
      t.string :first_last

      t.timestamps
    end
  end
end
