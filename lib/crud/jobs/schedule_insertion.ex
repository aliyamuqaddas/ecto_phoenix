defmodule Crud.Jobs.ScheduleInsertion do
  use Oban.Worker,
      queue: :insertion_in_db,
      max_attempts: 1

  alias Crud.Repo
  alias Crud.Accounts.Room


  @impl Oban.Worker
  def perform(%Oban.Job{}) do
    IO.inspect("working fine")
    #Insert Record in Rooms Table in Database
    Repo.insert(Room.changeset(%Room{}, %{name: "alia", description: "i am a girl.", photo: "its me.."}))
  end


end
