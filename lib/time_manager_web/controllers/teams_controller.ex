defmodule TimeManagerWeb.TeamsController do
  use TimeManagerWeb, :controller

  def index(conn, _params) do
    render(conn, :index)
  end

  def show(conn, _params) do
    render(conn, :index)
  end

  def store(conn, _params) do
    render(conn, :index)
  end

  def update(conn, _params) do
    render(conn, :index)
  end

  def delete(conn, _params) do
    render(conn, :index)
  end

  def showUsers(conn, _params) do
    render(conn, :index)
  end
end
