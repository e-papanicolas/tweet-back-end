class CreateTweets < ActiveRecord::Migration[7.0]
  def change
    create_table :tweets do |t|
      t.belongs_to :event, null: false, foreign_key: true
      t.string :name
      t.string :username
      t.string :tweeted_at
      t.integer :retweet_count
      t.integer :reply_count
      t.integer :like_count
      t.integer :quote_count
      t.string :hashtags, array: true, default: []

      t.timestamps
    end
  end
end
