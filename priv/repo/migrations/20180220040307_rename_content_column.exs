defmodule Discuss.Repo.Migrations.RenameContentColumn do
  use Ecto.Migration

  def change do
    rename(table(:comments), :coontent, to: :content)
  end
end
