class CommentsController < ApplicationController
  before_action :set_comment, only: [:approve, :destroy]

  def create
    @entry = Entry.find(params[:entry_id])
    @comment = @entry.comments.build(comment_params)
    @comment.save
    redirect_to blog_entry_path(@entry.blog_id, @entry.id), notice: 'comment created.'
  end

  def approve
    @comment.update(status: 'approved')
    redirect_to blog_entry_path(params[:blog_id], params[:entry_id]), notice: 'comment approved.'
  end

  def destroy
    @comment.destroy
    redirect_to blog_entry_path(params[:blog_id], params[:entry_id]), notice: 'comment approved.'
  end

  private
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:body)
    end
end
