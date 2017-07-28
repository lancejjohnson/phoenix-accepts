defmodule Accepts.Router do
  use Accepts.Web, :router

  pipeline :api do
    plug :accepts, ["json-api"]
  end

  scope "/api", Accepts do
    pipe_through :api
    scope "/v1" do
      get "/foo", V1.FooController, :index
    end
  end
end
