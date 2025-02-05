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

{:ok, salon} = BackendSalon.Scheduling.create_salon(%{name: "Ed Salon", location: "Eds place"})

BackendSalon.Scheduling.create_service(%{price: 1000, salon_id: salon.id})

BackendSalon.Scheduling.create_appointment(%{
  customer_name: "Leo",
  service_name: "hair_cut",
  appointment_time: "2025-02-05 19:07:12.378432Z",
  salon_id: salon.id
})
