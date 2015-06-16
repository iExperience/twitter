# == Schema Information
#
# Table name: hashtag_tweets
#
#  id         :integer          not null, primary key
#  tweet_id   :integer
#  hashtag_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class HashtagTweet < ActiveRecord::Base
  belongs_to :tweet
  belongs_to :hashtag
end
