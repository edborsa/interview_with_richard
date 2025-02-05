defmodule BackendSalon.Repo.Migrations.CreateServices do
  use Ecto.Migration

  def change do
    create table(:services, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string, null: false
      add :price, :decimal, null: false
      add :salon_id, references(:salons, type: :binary_id, on_delete: :delete_all)

      timestamps(type: :utc_datetime)
    end

    create index(:services, [:salon_id])
  end
end
