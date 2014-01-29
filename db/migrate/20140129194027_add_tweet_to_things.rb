class AddTweetToThings < ActiveRecord::Migration
  def change
    add_column :things, :tweet, :boolean
    add_column :things, :tweeted_at, :datetime
  end
end
