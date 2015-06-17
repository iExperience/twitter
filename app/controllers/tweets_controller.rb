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

  def map
    @tweets = Tweet.all
    @tweet_pins = get_tweet_pins(@tweets)
  end

  private

    def get_tweet_pins(tweets)
      Gmaps4rails.build_markers(tweets) do |tweet, marker|
      marker.lat tweet.latitude
      marker.lng tweet.longitude
      marker.infowindow tweet.body
    end

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