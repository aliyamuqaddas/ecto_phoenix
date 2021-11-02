defmodule Crud.Jobs.ScheduleInsertion do
  use Oban.Worker,
      queue: :insertion_in_db,
      max_attempts: 1

  @impl Oban.Worker
  def perform(%Oban.Job{}) do
    IO.inspect("hello")
    #Insert Record in Rooms Table in Database


  end


end
