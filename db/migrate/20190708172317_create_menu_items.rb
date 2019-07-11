class CreateMenuItems < ActiveRecord::Migration[5.2]
  def change
    create_table :menu_items do |t|
      t.string :name
      t.string :img_url
      t.string :description
      t.float :price
      t.belongs_to :restaurant, foreign_key: true

      t.timestamps
    end
  end
end
