defmodule FlutterApiWeb.Api.Mutation.TaskTest do
  use FlutterApiWeb.ConnCase, async: true
  alias FlutterApi.Fixtures

  @create_task_mutation """
  mutation($task: TaskInput!) {
    createTask(task: $task) {
      name
      completed
    }
  }
  """

  @update_task_mutation """
  mutation($task: TaskInput!, $id: ID!) {
    updateTask(task: $task, id: $id) {
      name
      completed
    }
  }
  """

  test "can create task", %{conn: conn} do
    response = post(conn, "/api", %{query: @create_task_mutation, variables: %{"task" => %{"name" => "Write code", "completed" => false}}})
    assert %{
             "data" => %{
               "createTask" => %{"name" => "Write code", "completed" => false}
             }
           } = json_response(response, 200)
  end

  test "update existing task", %{conn: conn} do
    task = Fixtures.task_fixture()
    response = post(conn, "/api", %{query: @update_task_mutation, variables: %{"task" => %{"name" => "updated", "completed" => true}, "id" => task.id}})
    assert %{
             "data" => %{
               "updateTask" => %{"name" => "updated", "completed" => true}
             }
           } = json_response(response, 200)
  end

  test "cannot update non existing task", %{conn: conn} do
    response = post(conn, "/api", %{query: @update_task_mutation, variables: %{"task" => %{"name" => "updated", "completed" => true}, "id" => 1}})
    assert %{
             "data" => %{
               "updateTask" => nil
             },
            "errors" => [%{"message" => "Task does not exist"}]
           } = json_response(response, 200)
  end
end