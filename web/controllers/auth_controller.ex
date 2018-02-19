defmodule Discuss.AuthController do
  use Discuss.Web, :controller
  plug(Ueberauth)

  # alias Discuss.User to User
  alias Discuss.User

  def callback(%{assigns: %{ueberauth_auth: auth}} = conn, _params) do
    user_params = %{token: auth.credentials.token, email: auth.info.email, provider: "github"}
    changeset = User.changeset(%User{}, user_params)
  end
end
