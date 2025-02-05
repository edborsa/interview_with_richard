defmodule BackendSalon.Repo.Migrations.CreateSalon do
  use Ecto.Migration

  def change do
    create table(:salons, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :location, :string

      timestamps(type: :utc_datetime)
    end
  end
end
