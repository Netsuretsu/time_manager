defmodule TimeManager.Working_times.Working_time do
  use Ecto.Schema
  import Ecto.Changeset

  schema "working_times" do
    field :start, :naive_datetime
    field :end, :naive_datetime
    # field :user_id, :id
    belongs_to :user, TimeManager.Users.User

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(working_time, attrs) do
    working_time
    |> cast(attrs, [:start, :end, :user_id])
    |> validate_required([:start, :end, :user_id], message: "Start and End can't be null")
    |> validate_format(:start, ~r/\A\d{4} - \d{2} - \d{2} \d{2} : \d{2} : \d{2}\z/)
    |> validate_format(:end, ~r/\A\d{4} - \d{2} - \d{2} \d{2} : \d{2} : \d{2}\z/)
  end
end
