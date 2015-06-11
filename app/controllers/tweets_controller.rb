class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(params["tweet"].permit(:body, :user_id, :fav_count))
    
    if @tweet.save
      redirect_to '/tweets'
    else
      render :new
    end
  end
end