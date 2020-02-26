defmodule FlutterApiWeb.Api.Query.TaskTest do
  use FlutterApiWeb.ConnCase, async: true
  alias FlutterApi.Fixtures

  @all_tasks_query """
  query {
    allTasks {
      name
      completed
    }
  }
  """

  @get_task_query """
  query($id: ID!) {
    getTask(id: $id) {
      name
      completed
    }
  }
  """

  setup do: {:ok, task: Fixtures.task_fixture(%{name: "Write code", completed: false})}

  test "can get all tasks", %{conn: conn} do
    response = post(conn, "/api", %{query: @all_tasks_query})

    assert %{
             "data" => %{
               "allTasks" => [
                 %{"name" => "Write code", "completed" => false}
               ]
             }
           } = json_response(response, 200)
  end

  test "can get a single task", %{conn: conn, task: %{id: task_id}} do
    response = post(conn, "/api", %{query: @get_task_query, variables: %{"id" => task_id}})
    assert %{
             "data" => %{
               "getTask" => %{"name" => "Write code", "completed" => false}
             }
           } = json_response(response, 200)
  end
end
