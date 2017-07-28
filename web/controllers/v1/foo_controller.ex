defmodule Accepts.V1.FooController do
  use Accepts.Web, :controller

  def index(conn, %{"greet" => greet}) do
    data = %{hello: greet}
    render conn, "data.json", data: data
  end
end
