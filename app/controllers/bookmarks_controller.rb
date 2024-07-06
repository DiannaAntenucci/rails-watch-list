class BookmarksController < ApplicationController
  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
      if @bookmark.save
        redirect_to_bookmark_path(@bookmark)
      else
        render :new, status: :unprocessable_entity
      end
    end
  end

  def set_list
    @bookmark = Bookmark.find(params[:id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id, :list_id)
  end
end
