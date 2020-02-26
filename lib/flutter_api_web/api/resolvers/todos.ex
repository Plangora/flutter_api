defmodule FlutterApiWeb.Api.Resolvers.Todos do
  alias FlutterApi.Todos

  def list_tasks(_root, _args, _content), do: {:ok, Todos.list_tasks()}

  def get_task(_root, %{id: id}, _context), do: {:ok, Todos.get_task!(id)}
end