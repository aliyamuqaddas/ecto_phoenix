defmodule Crud.Repo.Migrations.AvatarBelongsToUser do
  use Ecto.Migration

  def change do
    alter table(:avatars) do
      add :user_id, references(:users)
#      has_one :avatar, Crud.Avatar  # this was added
    end

  end
end
