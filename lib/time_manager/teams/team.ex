defmodule TimeManager.Teams.Team do
  use Ecto.Schema
  import Ecto.Changeset

  schema "teams" do
    field :name, :string
    # field :user_id, :id
    belongs_to :user, TimeManager.Users.User

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(team, attrs) do
    team
    |> cast(attrs, [:name, :user_id])
    |> validate_required([:name, :user_id])
  end
end
