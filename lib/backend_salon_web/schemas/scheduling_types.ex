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
    field :name, :string
    field :location, :string
  end

  object :service do
    field :price, :decimal
    belongs_to :salon, Salon
  end
end
