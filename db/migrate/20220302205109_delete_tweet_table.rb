class DeleteTweetTable < ActiveRecord::Migration[7.0]
  def change
    drop_table :tweets
    drop_table :event_makers
  end
end
