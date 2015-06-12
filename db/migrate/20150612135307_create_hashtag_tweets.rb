class CreateHashtagTweets < ActiveRecord::Migration
  def change
    create_table :hashtag_tweets do |t|
      t.integer :tweet_id
      t.integer :hashtag_id

      t.timestamps null: false
    end
  end
end
