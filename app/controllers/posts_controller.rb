class PostsController < ApplicationController
    def index
        sports = params[:sports]
        sex = params[:sex]
        ouen = params[:ouen]
        win = params[:win]
        uni = params[:uni]
        star = params[:star]
        color = params[:color]
        kantoku = params[:kantoku]
        demand = params[:demand]
        kane = params[:kane]
        wakate = params[:wakate]

        @result = sports + sex + ouen + win + uni + star + color + kantoku + demand + kane + wakate
        @posts = Post.all
    end

    def post_params
     params.require(:post).permit(:image_id)
    end

end
