class AddFacebookToThing < ActiveRecord::Migration
  def change
    add_column :things, :facebook, :boolean
  end
end
