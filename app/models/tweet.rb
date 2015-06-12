class Tweet < ActiveRecord::Base
  belongs_to :user
  has_many :hashtag_tweets
  has_many :hashtags, through: :hashtag_tweets

  validates(:body, {
    :presence => true, 
    :length => {:maximum => 140}
  })

  validates(:user, :presence => true)
end