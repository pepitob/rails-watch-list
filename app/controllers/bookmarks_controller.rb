require "json"
require "rest-client"

class BookmarksController < ApplicationController
  before_action :set_list, only: %i[new create]

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@list)
    else
      flash[:alert] = "This movie already has a bookmark in this list."
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to list_path(@bookmark.list), status: :see_other
  end

  private

  def set_list
    @list = List.find(params[:list_id])
  end

  def bookmark_params
    movie_title = params[:bookmark][:movie]
    if Movie.find_by(title: movie_title)
      @movie = Movie.find_by(title: movie_title)
    else
      movie_url = "https://api.themoviedb.org/3/search/movie?api_key=#{ENV["MOVIEDB_API_KEY"]}&query=#{movie_title}"
      response = RestClient.get movie_url
      data = JSON.parse(response)["results"].first()
      @movie = Movie.create(title: data["title"], overview: data["overview"], poster_url: "https://image.tmdb.org/t/p/original#{data["poster_path"]}", rating: data["vote_average"])
    end
    params[:bookmark][:movie_id] = @movie.id
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
