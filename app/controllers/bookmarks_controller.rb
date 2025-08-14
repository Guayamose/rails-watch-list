# app/controllers/bookmarks_controller.rb
class BookmarksController < ApplicationController
  before_action :set_list

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = @list.bookmarks.build(bookmark_params)  # ✅ singular model, tied to @list
    if @bookmark.save
      redirect_to @list, notice: "Movie bookmarked!"
    else
      # re-render the selection page with remaining movies
      @movies_not_in_list = Movie.where.not(id: @list.movie_ids)
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_list
    @list = List.find(params[:list_id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:movie_id, :comment)
  end
end

