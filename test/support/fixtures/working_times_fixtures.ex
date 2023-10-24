defmodule TimeManager.Working_timesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `TimeManager.Working_times` context.
  """

  @doc """
  Generate a working_time.
  """
  def working_time_fixture(attrs \\ %{}) do
    {:ok, working_time} =
      attrs
      |> Enum.into(%{
        end: ~N[2023-10-23 13:34:00],
        start: ~N[2023-10-23 13:34:00]
      })
      |> TimeManager.Working_times.create_working_time()

    working_time
  end
end
