defmodule BackendSalon.Repo.Migrations.CreateAppointments do
  use Ecto.Migration

  def change do
    create table(:appointments, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :customer_name, :string
      add :service_name, :string
      add :appointment_time, :utc_datetime
      add :salon_id, references(:salons, on_delete: :nothing, type: :binary_id)

      timestamps(type: :utc_datetime)
    end

    create index(:appointments, [:salon_id])
  end
end
