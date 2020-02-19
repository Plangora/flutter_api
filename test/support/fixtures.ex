defmodule FlutterApi.Fixtures do
  def task_fixture(attrs \\ %{}) do
    {:ok, task} =
      attrs
      |> Enum.into(%{completed: true, name: "some name"})
      |> FlutterApi.Todos.create_task()

    task
  end
end