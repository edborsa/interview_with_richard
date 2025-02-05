defmodule BackendSalonWeb.Resolvers.Scheduling do
  alias BackendSalon.Scheduling
  alias BackendSalon.Repo

  def list_appointments(_parent, _args, _resolution) do
    {:ok, Scheduling.list_appointments()}
  end

  def create_appointment(_parent, args, _resolution) do
    with {:ok, appointment} <- Scheduling.create_appointment(args) do
      appointment = Repo.preload(appointment, [:salon, :service])
      {:ok, appointment}
    end
  end

  def update_appointment(_parent, %{id: id} = args, _resolution) do
    case Scheduling.list_appointments() |> Enum.find(&(&1.id == id)) do
      nil ->
        {:error, "Appointment not found"}

      appointment ->
        with {:ok, updated} <- Scheduling.update_appointment(appointment, args) do
          updated = Repo.preload(updated, [:salon, :service])
          {:ok, updated}
        end
    end
  end

  def delete_appointment(_parent, %{id: id}, _resolution) do
    case Scheduling.list_appointments() |> Enum.find(&(&1.id == id)) do
      nil -> {:error, "Appointment not found"}
      appointment -> Scheduling.delete_appointment(appointment)
    end
  end

  def list_salons(_parent, _args, _resolution) do
    salons =
      Scheduling.list_salons()
      |> Repo.preload(:services)

    {:ok, salons}
  end
end
