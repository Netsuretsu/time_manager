defmodule TimeManager.Working_timesTest do
  use TimeManager.DataCase

  alias TimeManager.Working_times

  describe "working_times" do
    alias TimeManager.Working_times.Working_time

    import TimeManager.Working_timesFixtures

    @invalid_attrs %{start: nil, end: nil}

    test "list_working_times/0 returns all working_times" do
      working_time = working_time_fixture()
      assert Working_times.list_working_times() == [working_time]
    end

    test "get_working_time!/1 returns the working_time with given id" do
      working_time = working_time_fixture()
      assert Working_times.get_working_time!(working_time.id) == working_time
    end

    test "create_working_time/1 with valid data creates a working_time" do
      valid_attrs = %{start: ~N[2023-10-23 13:34:00], end: ~N[2023-10-23 13:34:00]}

      assert {:ok, %Working_time{} = working_time} = Working_times.create_working_time(valid_attrs)
      assert working_time.start == ~N[2023-10-23 13:34:00]
      assert working_time.end == ~N[2023-10-23 13:34:00]
    end

    test "create_working_time/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Working_times.create_working_time(@invalid_attrs)
    end

    test "update_working_time/2 with valid data updates the working_time" do
      working_time = working_time_fixture()
      update_attrs = %{start: ~N[2023-10-24 13:34:00], end: ~N[2023-10-24 13:34:00]}

      assert {:ok, %Working_time{} = working_time} = Working_times.update_working_time(working_time, update_attrs)
      assert working_time.start == ~N[2023-10-24 13:34:00]
      assert working_time.end == ~N[2023-10-24 13:34:00]
    end

    test "update_working_time/2 with invalid data returns error changeset" do
      working_time = working_time_fixture()
      assert {:error, %Ecto.Changeset{}} = Working_times.update_working_time(working_time, @invalid_attrs)
      assert working_time == Working_times.get_working_time!(working_time.id)
    end

    test "delete_working_time/1 deletes the working_time" do
      working_time = working_time_fixture()
      assert {:ok, %Working_time{}} = Working_times.delete_working_time(working_time)
      assert_raise Ecto.NoResultsError, fn -> Working_times.get_working_time!(working_time.id) end
    end

    test "change_working_time/1 returns a working_time changeset" do
      working_time = working_time_fixture()
      assert %Ecto.Changeset{} = Working_times.change_working_time(working_time)
    end
  end
end
