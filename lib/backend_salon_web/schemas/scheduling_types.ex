defmodule BackendSalonWeb.Schemas.SchedulingTypes do
  use Absinthe.Schema.Notation

  scalar :decimal do
    parse(fn
      %{value: value}, _ ->
        Decimal.parse(value)

      _, _ ->
        :error
    end)

    serialize(&to_string/1)
  end

  object :salon do
    field :id, :id
    field :name, :string
    field :location, :string
    # Add this line
    field :services, list_of(:service)
  end

  # Rest of the types remain the same
  object :service do
    field :id, :id
    field :name, :string
    field :price, :decimal
    field :salon, :salon
  end

  object :appointment do
    field :id, :id
    field :customer_name, :string
    field :appointment_time, :datetime
    field :salon, :salon
    field :service, :service
  end

  scalar :datetime do
    parse(fn input ->
      case DateTime.from_iso8601(input.value) do
        {:ok, datetime, _} -> {:ok, datetime}
        _ -> :error
      end
    end)

    serialize(&DateTime.to_iso8601/1)
  end
end
