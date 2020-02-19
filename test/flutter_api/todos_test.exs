defmodule FlutterApi.TodosTest do
  use FlutterApi.DataCase, async: true

  alias FlutterApi.Todos
  alias FlutterApi.Todos.Task

  describe "tasks" do
    test "create_task/1 with valid data creates a task" do
      assert {:ok, %Task{} = task} = Todos.create_task(%{completed: true, name: "some name"})
      assert task.completed == true
      assert task.name == "some name"
    end

    test "create_task/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Todos.create_task(%{completed: nil, name: nil})
    end
  end

  describe "task created" do
    setup do: {:ok, task: FlutterApi.Fixtures.task_fixture()}

    test "list_tasks/0 returns all tasks", %{task: task} do
      assert Todos.list_tasks() == [task]
    end

    test "get_task!/1 returns the task with given id", %{task: task} do
      assert Todos.get_task!(task.id) == task
    end

    test "update_task/2 with valid data updates the task", %{task: task} do
      assert {:ok, %Task{} = task} = Todos.update_task(task, %{completed: false, name: "some updated name"})
      assert task.completed == false
      assert task.name == "some updated name"
    end

    test "update_task/2 with invalid data returns error changeset", %{task: task} do
      assert {:error, %Ecto.Changeset{}} = Todos.update_task(task, %{completed: nil, name: nil})
      assert task == Todos.get_task!(task.id)
    end

    test "delete_task/1 deletes the task", %{task: task} do
      assert {:ok, %Task{}} = Todos.delete_task(task)
      assert_raise Ecto.NoResultsError, fn -> Todos.get_task!(task.id) end
    end

    test "change_task/1 returns a task changeset", %{task: task} do
      assert %Ecto.Changeset{} = Todos.change_task(task)
    end
  end
end
