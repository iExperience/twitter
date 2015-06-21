class TweetMailer < ApplicationMailer
  def tweet_email(tweet)
    @tweet = tweet
    mail(to: tweet.user.email, subject: 'NICE JOB TWEETING')
  end
end
