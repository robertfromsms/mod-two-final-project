class CreateDrivers < ActiveRecord::Migration[5.2]
  def change
    create_table :drivers do |t|
      t.string :driver_name
      t.string :name
      t.string :password_digest

      t.timestamps
    end
  end
end
