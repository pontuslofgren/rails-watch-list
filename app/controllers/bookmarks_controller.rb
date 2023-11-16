class BookmarksController < ApplicationController

  def new
    @bookmark = Bookmark.new
    @list = List.find(params[:list_id])
  end

  def new_from_movies
    @bookmark = Bookmark.new
    @movie = Movie.find(params[:movie_id])
  end

  # def create_from_movies
  #   raise
  #   @movie = List.find(params[:movie_id])
  #   @bookmark = Bookmark.new(bookmark_from_movies_params)

  #   @bookmark.list = @list
  #   if @bookmark.save
  #     redirect_to list_path(@list)
  #   else
  #     render :new, status: :unprocessable_entity
  #   end
  # end

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
      # redirect_to list_path(@bookmark.list_id) if @movie
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id, :list_id)
  end

  # def bookmark_from_movies_params
  #   params.require(:bookmark).permit(:comment, :list_id, :movie_id)
  # end

end
