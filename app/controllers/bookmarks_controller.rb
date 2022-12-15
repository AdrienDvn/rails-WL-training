class BookmarksController < ApplicationController
  def new
    @bookmark = Bookmark.new
  end

  def create
    # @bookmark = Bookmark.find(params[:id])
    # @list = List.find(params[:list_id])
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list

    if @bookmark.save # Will raise ActiveModel::ForbiddenAttributesError
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])

    @bookmark.destroy

    redirect_to lists_path, status: :see_other
  end

  private

  def bookmark_params
  params.require(:bookmark).permit(:comment, :movie_id)
  end
end
