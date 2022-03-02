class AddTweetArrayToEvent < ActiveRecord::Migration[7.0]
  def change
    add_column :events, :tweets, :integer, array: true, default: []
  end
end
