defmodule Crud.Repo.Migrations.AddPhotoCol do
  use Ecto.Migration

  def change do
    alter table(:rooms) do
      add :photo, :string
    end

  end
end
