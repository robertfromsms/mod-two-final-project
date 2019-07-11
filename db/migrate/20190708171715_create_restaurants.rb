class CreateRestaurants < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurants do |t|
      t.string :rest_name
      t.string :name
      t.string :img_url
      t.string :description
      t.string :password_digest
      t.string :address

      t.timestamps
    end
  end
end
