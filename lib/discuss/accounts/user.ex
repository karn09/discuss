defmodule Discuss.Accounts.User do
  use Discuss.Web, :model

  # allow for conversion and return of JSON user.
  @derive {Poison.Encoder, only: [:email]}

  schema "users" do
    field(:email, :string)
    field(:provider, :string)
    field(:token, :string)
    has_many(:topics, Discuss.Discussions.Topic)
    has_many(:comments, Discuss.Discussions.Comment)

    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:email, :provider, :token])
    |> validate_required([:email, :provider, :token])
  end
end
