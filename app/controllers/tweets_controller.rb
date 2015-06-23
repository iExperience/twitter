class TweetsController < ApplicationController
  before_action :load_tweets, :only => [:index, :create]
  before_action :load_new_tweet, :only => [:index, :new]
  before_action :authenticate_admin!, :only => [:destroy]

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

  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy

    flash[:notice] = "Your tweet was deleted successfully."

    redirect_to tweets_path
  end

  def map
    @tweets = Tweet.with_location
    @tweet_pins = Gmaps4rails.build_markers(@tweets) do |tweet, marker|
      marker.lat tweet.latitude
      marker.lng tweet.longitude
      marker.infowindow tweet.body
    end
  end

  private

    def tweet_params
      params["tweet"].permit(:body).merge(:user => current_user)
    end

    def load_new_tweet
      @new_tweet = Tweet.new
    end

    def load_tweets
      @tweets = Tweet.all.order('id DESC').includes(:hashtags, :user)
    end
end