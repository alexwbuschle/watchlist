defmodule Watchlist.MovieController do
  use Watchlist.Web, :controller
  alias Watchlist.Movie

  def index(conn, _params) do
    movies = Repo.all(Movie)
    render conn, movies: movies
  end
end
