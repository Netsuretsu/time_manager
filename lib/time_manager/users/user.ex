defmodule TimeManager.Users.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :username, :string
    field :password, :string
    field :role, Ecto.Enum, values: [:employee, :manager, :general_manager]
    field :phone, :string
    field :email, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:username, :password, :phone, :email, :role])
    |> validate_required([:username, :password, :phone, :email, :role])
    |> validate_format(:email, ~r/X@X.X/)
    |> unique_constraint(:email)
  end
end
