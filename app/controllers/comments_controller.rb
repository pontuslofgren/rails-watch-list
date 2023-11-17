class CommentsController < ActionController::Base

  def create
    @comment = Comment.new(comment_params)
    @list = List.find(params[:id])
    @comment.list_id = @list.id
    if @comment.save
      puts "saved"
    else
      redirect_to list_path(@list)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
