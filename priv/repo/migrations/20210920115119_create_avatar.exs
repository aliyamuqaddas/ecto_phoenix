defmodule Crud.Repo.Migrations.CreateAvatar do
  use Ecto.Migration

  def change do
    create table(:avatars) do
      add :nick_name, :string
      add :pic_url, :string
#      belongs_to :user, Crud.User  # this was added

    end

  end
end
