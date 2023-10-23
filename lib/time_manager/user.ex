defmodule TimeManager.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :email, :string
    field :password, :string
    field :phone, :string
    field :roles, Ecto.Enum, values: [:employee, :manager, :general_manager]
    field :username, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:username, :password, :phone, :email, :roles])
    |> validate_required([:username, :password, :phone, :email, :roles], message: "Can't be null")
    |> validate_format(:email, ~r/X@X.X/)
    |> unique_constraint(:email)
  end
end
