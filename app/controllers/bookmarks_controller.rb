class BookmarksController < ApplicationController
  before_action :set_list, only: %i[new create destroy]

  def new
    @bookmark = Bookmark.new
    @movies = Movie.all
    # @movies = @movies.map do |movie|
    #   movie[:title]
    # end
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    if @bookmark.save
      redirect_to(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @bookmark.destroy
    redirect_to @list, notice: 'Movie was successfully deleted!'
  end

  private

  def set_list
    @list = List.find(params[:list_id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
