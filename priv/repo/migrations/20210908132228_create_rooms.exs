defmodule Crud.Repo.Migrations.CreateRooms do
  use Ecto.Migration

  def change do
    create table(:rooms) do
      add :name, :string
      add :description, :string
      add :photo, :string

      timestamps()
    end

    create unique_index(:rooms, [:name])
  end
end
