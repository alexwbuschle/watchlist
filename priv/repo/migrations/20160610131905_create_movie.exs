defmodule Watchlist.Repo.Migrations.CreateMovie do
  use Ecto.Migration

  def change do
    create table(:movies) do
      add :name, :string
      add :rating, :integer

      timestamps
    end

  end
end
