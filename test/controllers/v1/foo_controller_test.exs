defmodule Accepts.V1.FooControllerTest do
  use Accepts.ConnCase, async: true

  @acceptable_json_api_header "application/vnd.api+json"
  @unacceptable_json_api_header "application/json"

  test "200 with json-api header", %{conn: conn} do
    conn =
      conn
      |> put_req_header("accept", @acceptable_json_api_header)
      |> get(foo_path(conn, :index, %{"greet" => "world"}))

    assert json_response(conn, 200) == %{"data" => %{"hello" => "world"}}
  end

  test "406 with unacceptable json-api header", %{conn: conn} do
    assert_raise Phoenix.NotAcceptableError, fn ->
      conn
      |> put_req_header("accept", @unacceptable_json_api_header)
      |> get(foo_path(conn, :index, %{"greet" => "world"}))
    end
  end

  test "406 without accept header", %{conn: conn} do
    assert_raise Phoenix.NotAcceptableError, fn ->
      get(conn, foo_path(conn, :index, %{greet: "world"}))
    end
  end
end
