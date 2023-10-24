defmodule TimeManagerWeb.Working_timeController do
  use TimeManagerWeb, :controller

  alias TimeManager.Working_times
  alias TimeManager.Working_times.Working_time

  action_fallback TimeManagerWeb.FallbackController

  def index(conn, _params) do
    working_times = Working_times.list_working_times()
    render(conn, :index, working_times: working_times)
  end

  def create(conn, %{"working_time" => working_time_params}) do
    with {:ok, %Working_time{} = working_time} <- Working_times.create_working_time(working_time_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/working_times/#{working_time}")
      |> render(:show, working_time: working_time)
    end
  end

  def show(conn, %{"id" => id}) do
    working_time = Working_times.get_working_time!(id)
    render(conn, :show, working_time: working_time)
  end

  def update(conn, %{"id" => id, "working_time" => working_time_params}) do
    working_time = Working_times.get_working_time!(id)

    with {:ok, %Working_time{} = working_time} <- Working_times.update_working_time(working_time, working_time_params) do
      render(conn, :show, working_time: working_time)
    end
  end

  def delete(conn, %{"id" => id}) do
    working_time = Working_times.get_working_time!(id)

    with {:ok, %Working_time{}} <- Working_times.delete_working_time(working_time) do
      send_resp(conn, :no_content, "")
    end
  end
end
