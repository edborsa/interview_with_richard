defmodule BackendSalon.Scheduling.Service do
  use Ecto.Schema
  import Ecto.Changeset

  alias BackendSalon.Scheduling.Salon

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "services" do
    field :price, :decimal
    belongs_to :salon, Salon, type: :binary_id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(service, attrs) do
    service
    |> cast(attrs, [:price, :salon_id])
    |> validate_required([:price, :salon_id])
  end
end
