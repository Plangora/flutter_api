defmodule FlutterApiWeb.Api.Resolvers.Todos do
  alias FlutterApi.Todos

  def list_tasks(_root, _args, _content), do: {:ok, Todos.list_tasks()}

  def get_task(_root, %{id: id}, _context), do: {:ok, Todos.get_task!(id)}

  def create_task(_root, %{task: task_params}, _context), do: Todos.create_task(task_params)

  def update_task(_root, %{task: task_params, id: task_id}, _context) do
    case Todos.get_task(task_id) do
      nil ->
        {:error, message: "Task does not exist"}
      task ->
        Todos.update_task(task, task_params)
    end
  end
end