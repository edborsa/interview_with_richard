defmodule BackendSalon.Repo do
  use Ecto.Repo,
    otp_app: :backend_salon,
    adapter: Ecto.Adapters.Postgres
end
