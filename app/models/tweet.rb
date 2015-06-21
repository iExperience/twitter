# == Schema Information
#
# Table name: tweets
#
#  id         :integer          not null, primary key
#  body       :string
#  user_id    :integer
#  fav_count  :integer
#  created_at :datetime
#  updated_at :datetime
#

class Tweet < ActiveRecord::Base
  belongs_to :user
  has_many :hashtag_tweets
  has_many :hashtags, through: :hashtag_tweets

  validates(:body, {
    :presence => true, 
    :length => {:maximum => 140}
  })

  validates(:user, :presence => true)

  scope :with_location, -> { where("latitude IS NOT NULL AND longitude IS NOT NULL") }

  after_create :create_hashtags
  #after_create :send_tweet_email

  private

  def send_tweet_email
    TweetMailer.tweet_email(self).deliver
  end

  def create_hashtags
    self.body.scan(/(#[a-zA-Z0-9]+)/).flatten.each do |hashtag|
      self.hashtags << Hashtag.new(body: hashtag[1..hashtag.size])
    end
  end
end
