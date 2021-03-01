class TweetsController < ApplicationController
  
  before_action :authenticate_user!, :except => [:index]
  

  def index
    if user_signed_in?
      @tweets = Tweet.tweets_for_me(current_user.id).page(params[:page]).per(50)
      ##@tweets = Tweet.all.page(params[:page]).per(50)
    else
      @tweets = Tweet.all.page(params[:page]).per(50)
    end
  end

  def new
    @tweet = Tweet.new
  end

  def show
    @tweet = Tweet.find(params[:id])
    @retweets = Tweet.where("tweet_id = ?", params[:id])
    @retweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.user_id = current_user.id
    @tweet.save

    redirect_to root_path
  end

  def read
  end

  def retweet
    @tweet = Tweet.new(tweet_params)
    @tweet.user_id = current_user.id

    if@tweet.save
      redirect_to root_path
    end
  end

  def destroy
    if Tweet.find(params[:id]).delete
      flash[:success] = "Tweet eliminado."
    end
    redirect_to root_path
  end

  private def tweet_params
    params.require(:tweet).permit(:contents, :user_id, :tweet_id)
  end
end
