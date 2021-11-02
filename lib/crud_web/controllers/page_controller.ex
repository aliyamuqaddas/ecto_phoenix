defmodule CrudWeb.PageController do
  use CrudWeb, :controller
  alias Crud.Accounts
  alias Crud.Accounts.Room


  def index(conn, _params) do
    render(conn, "index.html")
  end

   def home(conn, _params) do
    IO.inspect(_params)
     users= Accounts.list_rooms()
     render(conn, "show.html", users: users)
  end

  def new(conn, _params) do
    IO.inspect(_params)
    changeset = Accounts.change_room(%Room{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"room" => user_params}) do
    IO.inspect("these are the new params")
    IO.inspect(user_params)
    uploaded_files =
#      consume_uploaded_entries(socket, :photo, fn %{path: path}, _entry ->
#        dest = Path.join([:code.priv_dir(:my_app), "static", "uploads", Path.basename(path)])
#        File.cp!(path, dest)
#        Routes.static_path(socket, "/uploads/#{Path.basename(dest)}")
#      end)
    IO.inspect("its uploadedd files")
    IO.inspect(uploaded_files)
    case Accounts.create_room(user_params) do
      {:ok, room} ->
      rooms=Accounts.list_rooms()
        conn
        |> put_flash(:info, "Room created successfully.")
        |> redirect(to: Routes.page_path(conn, :home, rooms))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    user = Accounts.get_room!(id)
    render(conn, "show1.html", user: user)
  end

  def edit(conn, %{"id" => id}) do
    user = Accounts.get_room!(id)
    changeset = Accounts.change_room(user)
    IO.inspect(changeset)
    render(conn, "edit.html", user: user, changeset: changeset)
  end

  def update(conn, %{ "id" => id, "room" => user_params}) do
    IO.inspect("hihihihihihihiih")
    IO.inspect(user_params)
    user = Accounts.get_room!(id)
    rooms=Accounts.list_rooms()
    case Accounts.update_room(user, user_params) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "User updated successfully.")
        |> redirect(to: Routes.page_path(conn, :home, rooms))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", user: user, changeset: changeset)
    end
  end


  def delete(conn, %{"id" => id}) do
    user = Accounts.get_room!(id)
    {:ok, _user} = Accounts.delete_room(user)

    conn
    |> put_flash(:info, "Room deleted successfully.")
    |> redirect(to: Routes.page_path(conn, :home))
  end



#  def update(conn, user) do
#    IO.inspect(conn)
#    render(conn, "edit.html")
#  end

end
