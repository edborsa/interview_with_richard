defmodule BackendSalon.Scheduling.Salon do
  use Ecto.Schema
  import Ecto.Changeset

  alias BackendSalon.Scheduling.Service
  alias BackendSalon.Scheduling.Appointment

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "salons" do
    field :name, :string
    field :location, :string
    has_many :services, Service
    has_many :appointments, Appointment

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(salon, attrs) do
    salon
    |> cast(attrs, [:name, :location])
    |> validate_required([:name, :location])
  end
end
