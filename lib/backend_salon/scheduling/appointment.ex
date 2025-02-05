defmodule BackendSalon.Scheduling.Appointment do
  use Ecto.Schema
  import Ecto.Changeset
  alias BackendSalon.Scheduling.Salon

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "appointments" do
    field :customer_name, :string
    field :service_name, :string
    field :appointment_time, :utc_datetime
    belongs_to :salon, Salon, type: :binary_id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(appointment, attrs) do
    appointment
    |> cast(attrs, [:customer_name, :service_name, :appointment_time, :salon_id])
    |> validate_required([:customer_name, :service_name, :appointment_time, :salon_id])
  end
end
