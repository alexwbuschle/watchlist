defmodule Watchlist.Movie do
  use Watchlist.Web, :model

  schema "movies" do
    field :name, :string
    field :rating, :integer

    timestamps
  end

  @required_fields ~w(name rating)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end

  defimpl Poison.Encoder, for: Watchlist.Movie do
    def encode(movie, _options) do
      movie
      |> Map.from_struct
      |> Map.drop([:__meta__, :__struct__])
      |> Poison.encode!
    end
  end
end
