defmodule FlutterApiWeb.Router do
  use FlutterApiWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", FlutterApiWeb do
    pipe_through :browser

    get "/", PageController, :index
  end

  scope "/" do
    pipe_through :api

    forward "/api", Absinthe.Plug, schema: FlutterApiWeb.Api.Schema
  end

  # Other scopes may use custom stacks.
  # scope "/api", FlutterApiWeb do
  #   pipe_through :api
  # end
end
