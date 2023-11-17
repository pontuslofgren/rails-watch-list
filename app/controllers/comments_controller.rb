class CommentsController < ActionController::Base

  def create
    @comment = Comment.new(comment_params)
    @list = List.find(params[:id])
    @comment.list_id = @list.id

    if @comment.save
      redirect_to list_path(@list)
    else
      render 'lists/show', status: :unprocessable_entity, layout: 'application'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
