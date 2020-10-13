class MoviesController < ApplicationController
  before_action :require_user, only: :index

  def index
    @movies = if tmdb_query
                SearchResults.movie_search(tmdb_query)
              else
                SearchResults.top_rated_movies
              end
  end
end
