class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(params["tweet"].permit(:body, :user_id, :fav_count))
    @tweet.save

    redirect_to '/tweets'
  end
end