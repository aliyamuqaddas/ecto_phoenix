defmodule Crud.Jobs.EnqueueInsertion do
  use Oban.Worker,
      queue: :enqueue_insertion_in_db,
      max_attempts: 1

  alias Crud.Repo
  alias Crud.Accounts.Room
  alias Crud.Accounts

  def enqueue_room(id) do
    job =
      Crud.Jobs.EnqueueInsertion.new(
        %{"room_id" => id},
        queue: :enqueue_insertion_in_db,
        max_attempts: 1,
        scheduled_at: Timex.shift(Timex.now(), minutes: 5)
      )
      |> Oban.insert()

    case job do
      {:ok, %Oban.Job{}} -> :ok
      error -> error |> IO.inspect(label: "ERROR-ENQUEUE-THE-JOB")
    end
  end

  @impl Oban.Worker
  def perform(%Oban.Job{args: %{"room_id" => id}}) do
     #Delete the record from room table
      perform_deletion(id)
  end

  def perform_deletion(id) do
    user = Accounts.get_room!(id)
     Accounts.delete_room(user)
  end


end
