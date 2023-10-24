defmodule TimeManager.Working_times do
  @moduledoc """
  The Working_times context.
  """

  import Ecto.Query, warn: false
  alias TimeManager.Repo

  alias TimeManager.Working_times.Working_time

  @doc """
  Returns the list of working_times.

  ## Examples

      iex> list_working_times()
      [%Working_time{}, ...]

  """
  def list_working_times do
    Repo.all(Working_time)
  end

  @doc """
  Gets a single working_time.

  Raises `Ecto.NoResultsError` if the Working time does not exist.

  ## Examples

      iex> get_working_time!(123)
      %Working_time{}

      iex> get_working_time!(456)
      ** (Ecto.NoResultsError)

  """
  def get_working_time!(id), do: Repo.get!(Working_time, id)

  @doc """
  Creates a working_time.

  ## Examples

      iex> create_working_time(%{field: value})
      {:ok, %Working_time{}}

      iex> create_working_time(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_working_time(attrs \\ %{}) do
    %Working_time{}
    |> Working_time.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a working_time.

  ## Examples

      iex> update_working_time(working_time, %{field: new_value})
      {:ok, %Working_time{}}

      iex> update_working_time(working_time, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_working_time(%Working_time{} = working_time, attrs) do
    working_time
    |> Working_time.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a working_time.

  ## Examples

      iex> delete_working_time(working_time)
      {:ok, %Working_time{}}

      iex> delete_working_time(working_time)
      {:error, %Ecto.Changeset{}}

  """
  def delete_working_time(%Working_time{} = working_time) do
    Repo.delete(working_time)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking working_time changes.

  ## Examples

      iex> change_working_time(working_time)
      %Ecto.Changeset{data: %Working_time{}}

  """
  def change_working_time(%Working_time{} = working_time, attrs \\ %{}) do
    Working_time.changeset(working_time, attrs)
  end
end
