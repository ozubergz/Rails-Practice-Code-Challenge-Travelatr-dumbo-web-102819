class PostsController < ApplicationController

    def new
        @post = Post.new
    end

    def show
        @post = Post.find(params[:id])
    end

    def upvote
        Post.increment_counter(:likes, params[:id])
    end

    def create
        post = Post.new(post_params)
        post.likes = 0
        if post.save
            redirect_to post
        else
            flash[:errors] = post.errors.full_messages
            redirect_to new_post_path
        end
    end

    private
    
    def post_params
        params.require(:post).permit(:title, :content, :blogger_id, :destination_id )
    end
end
