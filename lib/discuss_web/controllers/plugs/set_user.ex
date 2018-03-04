defmodule Discuss.Plugs.SetUser do
  @moduledoc """
  Provides Plug to assign user.

  Plugs must define an init, and call function.
  """
  import Plug.Conn
  # import Phoenix.Controller

  alias Discuss.Repo
  alias Discuss.User

  @doc """
  Called only when first initialized, afterward the stored result is always injected into call as second parameter.
  """
  def init(_params) do
  end

  @doc """
  Expects conn, and params. Params is provided via init.

  Returns conn with assigned :user
  """
  def call(conn, _params) do
    user_id = get_session(conn, :user_id)

    cond do
      # user_id is true, then assign result of get to user.
      user = user_id && Repo.get(User, user_id) ->
        # conn.assigns.user => user struct
        assign(conn, :user, user)

      true ->
        assign(conn, :user, nil)
    end
  end
end
