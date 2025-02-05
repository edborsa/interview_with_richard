# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     BackendSalon.Repo.insert!(%BackendSalon.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias BackendSalon.{Repo, Scheduling.Salon, Scheduling.Service, Scheduling.Appointment}

# Create salon
{:ok, salon} =
  Repo.insert(%Salon{
    name: "Salon Name",
    location: "123 Foo St"
  })

# Create services
{:ok, haircut} =
  Repo.insert(%Service{
    name: "Haircut",
    price: Decimal.new("50.00"),
    salon_id: salon.id
  })

# Create appointment
Repo.insert(%Appointment{
  customer_name: "Ed Borsa",
  appointment_time: DateTime.utc_now() |> DateTime.truncate(:second),
  salon_id: salon.id,
  service_id: haircut.id
})
