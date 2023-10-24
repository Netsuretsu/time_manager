defmodule TimeManagerWeb.Working_timeJSON do
  alias TimeManager.Working_times.Working_time

  @doc """
  Renders a list of working_times.
  """
  def index(%{working_times: working_times}) do
    %{data: for(working_time <- working_times, do: data(working_time))}
  end

  @doc """
  Renders a single working_time.
  """
  def show(%{working_time: working_time}) do
    %{data: data(working_time)}
  end

  defp data(%Working_time{} = working_time) do
    %{
      id: working_time.id,
      start: working_time.start,
      end: working_time.end
    }
  end
end
