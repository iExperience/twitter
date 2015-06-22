class TweetMailer < ApplicationMailer
  default from: "salman.ansari@gmail.com"

  def tweet_email(tweet)
    @tweet = tweet
    mail(to: tweet.user.email, subject: 'Nice tweet!')
  end
end
