defmodule TimeManagerWeb.ClocksController do
  use TimeManagerWeb, :controller

  def index(conn, _params) do
    render(conn, :index)
  end

  def store(conn, _params) do
    render(conn, :index)
  end
end
