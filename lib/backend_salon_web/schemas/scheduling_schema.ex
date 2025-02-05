defmodule BackendSalonWeb.Schemas.SchedulingSchema do
  use Absinthe.Schema

  alias BackendSalonWeb.Resolvers.Scheduling

  import_types(BackendSalonWeb.Schemas.SchedulingTypes)

  query do
    @desc "Get all appointments"
    field :appointments, list_of(:appointment) do
      resolve(&Scheduling.list_appointments/3)
    end

    @desc "Get all salons with their services"
    field :salons, list_of(:salon) do
      resolve(&Scheduling.list_salons/3)
    end
  end

  mutation do
    @desc "Create appointment"
    field :create_appointment, :appointment do
      arg(:customer_name, non_null(:string))
      arg(:appointment_time, non_null(:datetime))
      arg(:salon_id, non_null(:id))
      arg(:service_id, non_null(:id))

      resolve(&Scheduling.create_appointment/3)
    end

    @desc "Update appointment"
    field :update_appointment, :appointment do
      arg(:id, non_null(:id))
      arg(:customer_name, :string)
      arg(:appointment_time, :datetime)
      arg(:salon_id, :id)
      arg(:service_id, :id)

      resolve(&Scheduling.update_appointment/3)
    end

    @desc "Delete appointment"
    field :delete_appointment, :appointment do
      arg(:id, non_null(:id))
      resolve(&Scheduling.delete_appointment/3)
    end
  end
end
