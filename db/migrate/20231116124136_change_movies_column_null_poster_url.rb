class ChangeMoviesColumnNullPosterUrl < ActiveRecord::Migration[7.1]
  def change
    change_column_null :movies, :poster_url, true
  end
end
