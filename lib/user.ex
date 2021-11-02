defmodule Crud.User do
  use Ecto.Schema

  schema "users" do
    field :name, :string
    field :email, :string
    has_one :avatar, Crud.Avatar  # this was added
  end
end

