class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all

    if params[:tag_ids]
      @tweets = []
      params[:tag_ids].each do |key, value|
        if value == "1"
          tag_tweets = Tag.find_by(name: key).tweets
          @tweets = @tweets.empty? ? tag_tweets : @tweets & tag_tweets
        end
      end
    end
    #ここまで

  end

    def new
     @tweet = Tweet.new
    end

    def create
       tweet = Tweet.new(tweet_params)
       if tweet.save
         redirect_to :action => "index"
       else
        redirect_to :action => "new"
       end
    end


  def show
    @tweet = Tweet.find(params[:id])
  end

  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
    redirect_to action: :index
  end

  private

  def tweet_params
    params.require(:tweet).permit(:image, :body, tag_ids: [])
  end

end
