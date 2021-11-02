defmodule Crud.Jobs.ScheduleInsertion do
  use Oban.Worker,
      queue: :insertion_in_db,
      max_attempts: 1

  alias Crud.Repo
  alias Crud.Accounts.Room

  @impl Oban.Worker
  def perform(%Oban.Job{}) do
    #Insert Record in Rooms Table in Database
    record = %Room{name: "alia", description: "i am a girl.", photo: "its me.."}
    Repo.insert!(record)
    IO.inspect("inserted!")

  end


end
