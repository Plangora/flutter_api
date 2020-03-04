defmodule FlutterApiWeb.Api.Schema do
  use Absinthe.Schema
  alias FlutterApiWeb.Api.{Types, Resolvers}

  import_types Types.Task

  query do
    @desc "Get all tasks"
    field :all_tasks, list_of(non_null(:task)) do
      resolve &Resolvers.Todos.list_tasks/3
    end

    @desc "Get a single task by ID"
    field :get_task, :task do
      arg :id, non_null(:id)
      resolve &Resolvers.Todos.get_task/3
    end
  end

  mutation do
    @desc "Create a task"
    field :create_task, :task do
      arg :task, non_null(:task_input)
      resolve &Resolvers.Todos.create_task/3
    end

    @desc "Updates a task"
    field :update_task, :task do
      arg :task, non_null(:task_input)
      arg :id, non_null(:id)
      resolve &Resolvers.Todos.update_task/3
    end
  end
end