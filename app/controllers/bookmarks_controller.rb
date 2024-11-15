class BookmarksController < ApplicationController
  before_action :set_list, only: %i[new create]
  def new
    # We need @restaurant in our `simple_form_for`
    @list = set_list
    @bookmark = Bookmark.new
    @movies = Movie.all
  end


  def create
    @bookmark = @list.bookmarks.new(bookmark_params)
    @bookmark.save
    if @bookmark.save
      redirect_to list_path(@list)
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
      # No need for app/views/restaurants/destroy.html.erb
    redirect_to @bookmark.list, status: :see_other
  end

  private

  def set_list
    @list = List.find(params[:list_id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:movie_id, :list_id, :comment)
  end

end
