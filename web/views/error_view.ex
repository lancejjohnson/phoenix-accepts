defmodule Accepts.ErrorView do
  use Accepts.Web, :view

  def render("404.json", _assigns) do
    %{errors: %{detail: "Page not found"}}
  end

  def render("406.json", %{kind: :error, reason: %{accepts: ["json-api"]}}) do
    %{errors: %{detail: "Missing acceptable json-api header."}}
  end

  def render("500.json", _assigns) do
    %{errors: %{detail: "Internal server error"}}
  end

  # In case no render clause matches or no
  # template is found, let's render it as 500
  def template_not_found(_template, assigns) do
    render "500.json", assigns
  end
end
