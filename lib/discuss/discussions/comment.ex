defmodule Discuss.Discussions.Comment do
  use Discuss.Web, :model

  # Specify that Poison only encode to JSON specified atoms.
  @derive {Poison.Encoder, only: [:content, :user]}

  schema "comments" do
    field(:content, :string)
    belongs_to(:user, Discuss.Accounts.User)
    belongs_to(:topic, Discuss.Discussions.Topic)

    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:content])
    |> validate_required([:content])
  end
end
