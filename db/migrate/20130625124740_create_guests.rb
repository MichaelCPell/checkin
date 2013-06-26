class CreateGuests < ActiveRecord::Migration
  def change
    create_table :guests do |t|
      t.string :full_name
      t.string :email
      t.string :company
      t.string :attending_with

      t.timestamps
    end
  end
end
