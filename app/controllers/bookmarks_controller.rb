class BookmarksController < ApplicationController

  def new
    @bookmark = Bookmark.new
    @list = List.find(params[:list_id]) if params[:list_id]
    @movie = Movie.find(params[:movie_id]) if params[:movie_id]
  end

  def create
    if params[:list_id]
      @list = List.find(params[:list_id])
      @bookmark = Bookmark.new(bookmark_params)
      @bookmark.list = @list
    else
      @movie = Movie.find(params[:movie_id])
      @bookmark = Bookmark.new(bookmark_params)
      @bookmark.movie = @movie
    end

    if @bookmark.save
      redirect_to list_path(@list) if @list
      redirect_to list_path(@bookmark.list_id) if @movie
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id, :list_id)
  end
end
