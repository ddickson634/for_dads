class CommentsController < ApplicationController
    def create
        @post = Post.find(params[:post_id])
        @comment = @post.comments.new(params[:comment].permit(:name, :body))
        @comment.user_id = current_user.id
        @comment.save

        redirect_to post_path(@post)
    end
    
    def destroy
        @post = Post.find(params[:post_id])
        @comment = Comment.find(params[:id])
        @comment.destroy
        
        redirect_to post_path(@post)
    end
end
