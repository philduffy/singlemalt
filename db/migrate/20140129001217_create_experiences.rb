class CreateExperiences < ActiveRecord::Migration
  def change
    create_table :experiences do |t|
      t.string :name
      t.string :job
      t.string :url
      t.text :description
      t.date :started_at
      t.date :ended_at
      t.timestamps
    end
  end
end
