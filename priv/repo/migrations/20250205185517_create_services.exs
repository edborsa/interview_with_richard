defmodule BackendSalon.Repo.Migrations.CreateServices do
  use Ecto.Migration

  def change do
    create table(:services, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :price, :decimal
      add :salon_id, references(:salons, on_delete: :nothing, type: :binary_id)

      timestamps(type: :utc_datetime)
    end

    create index(:services, [:salon_id])
  end
end
