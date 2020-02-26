defmodule FlutterApiWeb.Api.Types.Task do
  use Absinthe.Schema.Notation

  object :task do
    field :id, non_null(:id)
    field :name, non_null(:string)
    field :completed, non_null(:boolean)
  end
end