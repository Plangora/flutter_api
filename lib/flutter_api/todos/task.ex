defmodule FlutterApi.Todos.Task do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tasks" do
    field :completed, :boolean, default: false
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(task, attrs) do
    task
    |> cast(attrs, [:name, :completed])
    |> validate_required([:name, :completed])
  end
end
