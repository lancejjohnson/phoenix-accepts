defmodule Accepts.V1.FooView do
  use Accepts.Web, :view

  def render("data.json", %{data: data}), do: %{data: data}
end
