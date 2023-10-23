defmodule TimeManager.Workingtime do
  use Ecto.Schema
  import Ecto.Changeset

  schema "workingtimes" do
    field :end, :naive_datetime
    field :start, :naive_datetime
    field :user_id, :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(workingtime, attrs) do
    workingtime
    |> cast(attrs, [:start, :end])
    |> validate_required([:start, :end], message: "Can't be null")
    |> validate_format(:start, ~r/YYYY-MM-DD HH:mm:ss/)
    |> validate_format(:end, ~r/YYYY-MM-DD HH:mm:ss/)
  end
end
