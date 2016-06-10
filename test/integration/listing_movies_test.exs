defmodule ListingMoviesIntegrationTest do
  use ExUnit.Case, async: true

  test 'listing movies' do
    response = conn(:get, '/movies')
    assert response.status == 200
  end
end
