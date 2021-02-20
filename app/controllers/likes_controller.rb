class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    @likes = Like.where(tweet_id: params[:tweet_id],user_id: current_user.id)

    if @likes.count > 0
      @likes.each do |like|
        like.destroy
      end
    else
      @like = Like.new
      @like.tweet_id = params[:tweet_id]
      @like.user_id = current_user.id
      @like.save
    end

    redirect_to root_path
  end

  def index
    @tweet = Tweet.find(params[:tweet_id])
    
  end



end
