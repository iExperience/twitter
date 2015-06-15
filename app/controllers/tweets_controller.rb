class TweetsController < ApplicationController
  before_action :load_tweets, :only => [:index, :create]
  before_action :load_new_tweet, :only => [:index]

  def index
  end

  def create
    @tweet = Tweet.new(params["tweet"].permit(:body))
    # THIS IS A HACK
    # FIX THIS USING AUTHORIZATION
    @tweet.user = User.last
    
    if @tweet.save
      redirect_to '/tweets'
    else
      render :index
    end
  end

  private

    def load_new_tweet
      @tweet = Tweet.new
    end

    def load_tweets
      @tweets = Tweet.order(created_at: :desc)
    end
end