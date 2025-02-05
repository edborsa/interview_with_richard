defmodule BackendSalon.SchedulingFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `BackendSalon.Scheduling` context.
  """

  @doc """
  Generate a salon.
  """
  def salon_fixture(attrs \\ %{}) do
    {:ok, salon} =
      attrs
      |> Enum.into(%{
        location: "some location",
        name: "some name"
      })
      |> BackendSalon.Scheduling.create_salon()

    salon
  end

  @doc """
  Generate a service.
  """
  def service_fixture(attrs \\ %{}) do
    {:ok, service} =
      attrs
      |> Enum.into(%{
        price: "120.5"
      })
      |> BackendSalon.Scheduling.create_service()

    service
  end

  @doc """
  Generate a appointment.
  """
  def appointment_fixture(attrs \\ %{}) do
    {:ok, appointment} =
      attrs
      |> Enum.into(%{
        appointment_time: ~U[2025-02-04 19:00:00Z],
        customer_name: "some customer_name",
        service_name: "some service_name"
      })
      |> BackendSalon.Scheduling.create_appointment()

    appointment
  end
end
