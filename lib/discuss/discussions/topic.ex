defmodule Discuss.Discussions.Topic do
  use Discuss.Web, :model

  schema "topics" do
    field(:title, :string)
    belongs_to(:user, Discuss.Accounts.User)
    has_many(:comments, Discuss.Discussions.Comment)
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title])
    |> validate_required([:title])
  end
end
