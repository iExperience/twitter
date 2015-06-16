class TweetsController < ApplicationController
  before_action :load_tweets, :only => [:index, :create]
  before_action :load_new_tweet, :only => [:index, :new]

  def index
  end

  def new
  end

  def create
    @tweet = Tweet.new(tweet_params)

    if @tweet.save
      redirect_to '/tweets'
    else
      render :index
    end
  end

  private

    def tweet_params
      params["tweet"].permit(:body).merge(:user => current_user)
    end

    def load_new_tweet
      @tweet = Tweet.new
    end

    def load_tweets
      @tweets = Tweet.all
    end
end