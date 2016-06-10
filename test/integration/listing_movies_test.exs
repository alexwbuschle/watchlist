defmodule ListingMoviesIntegrationTest do
  use ExUnit.Case, async: true
  use Plug.Test
  alias Watchlist.Router
  alias Watchlist.Movie
  alias Watchlist.Repo

  @opts Router.init([])
  test 'listing movies' do
    %Movie{name: "Lord of the Rings", rating: 5} |> Repo.insert!
    movies = Repo.all(Movie)
            |> Poison.encode!

    conn = conn(:get, "/movies")
    response = Router.call(conn, @opts)
    assert response.status == 200
    assert response.resp_body == movies
  end
end
