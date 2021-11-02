defmodule Crud.Accounts.Room do
  use Ecto.Schema
  import Ecto.Changeset
  alias Crud.Accounts.Room

  schema "rooms" do
    field :description, :string
    field :name, :string
    field :photo, :string

    timestamps()
  end

  @doc false
  def changeset(%Room{} = room, attrs) do
    room
    |> cast(attrs, [:name, :description, :photo])
    |> validate_required([:name, :description, :photo])
    |> unique_constraint(:name)
  end
end
