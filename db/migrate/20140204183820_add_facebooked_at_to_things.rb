class AddFacebookedAtToThings < ActiveRecord::Migration
  def change
    add_column :things, :facebooked_at, :datetime
  end
end
