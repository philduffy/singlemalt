class CreateThingsTable < ActiveRecord::Migration
  def change
    create_table :things do |t|
      t.string :name
      t.text :description
      t.string :url
      t.string :image
      t.timestamps
    end
  end
end
