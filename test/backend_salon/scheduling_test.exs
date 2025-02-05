defmodule BackendSalon.SchedulingTest do
  use BackendSalon.DataCase

  alias BackendSalon.Scheduling

  describe "salon" do
    alias BackendSalon.Scheduling.Salon

    import BackendSalon.SchedulingFixtures

    @invalid_attrs %{name: nil, location: nil}

    test "list_salon/0 returns all salon" do
      salon = salon_fixture()
      assert Scheduling.list_salon() == [salon]
    end

    test "get_salon!/1 returns the salon with given id" do
      salon = salon_fixture()
      assert Scheduling.get_salon!(salon.id) == salon
    end

    test "create_salon/1 with valid data creates a salon" do
      valid_attrs = %{name: "some name", location: "some location"}

      assert {:ok, %Salon{} = salon} = Scheduling.create_salon(valid_attrs)
      assert salon.name == "some name"
      assert salon.location == "some location"
    end

    test "create_salon/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Scheduling.create_salon(@invalid_attrs)
    end

    test "update_salon/2 with valid data updates the salon" do
      salon = salon_fixture()
      update_attrs = %{name: "some updated name", location: "some updated location"}

      assert {:ok, %Salon{} = salon} = Scheduling.update_salon(salon, update_attrs)
      assert salon.name == "some updated name"
      assert salon.location == "some updated location"
    end

    test "update_salon/2 with invalid data returns error changeset" do
      salon = salon_fixture()
      assert {:error, %Ecto.Changeset{}} = Scheduling.update_salon(salon, @invalid_attrs)
      assert salon == Scheduling.get_salon!(salon.id)
    end

    test "delete_salon/1 deletes the salon" do
      salon = salon_fixture()
      assert {:ok, %Salon{}} = Scheduling.delete_salon(salon)
      assert_raise Ecto.NoResultsError, fn -> Scheduling.get_salon!(salon.id) end
    end

    test "change_salon/1 returns a salon changeset" do
      salon = salon_fixture()
      assert %Ecto.Changeset{} = Scheduling.change_salon(salon)
    end
  end

  describe "services" do
    alias BackendSalon.Scheduling.Service

    import BackendSalon.SchedulingFixtures

    @invalid_attrs %{price: nil}

    test "list_services/0 returns all services" do
      service = service_fixture()
      assert Scheduling.list_services() == [service]
    end

    test "get_service!/1 returns the service with given id" do
      service = service_fixture()
      assert Scheduling.get_service!(service.id) == service
    end

    test "create_service/1 with valid data creates a service" do
      valid_attrs = %{price: "120.5"}

      assert {:ok, %Service{} = service} = Scheduling.create_service(valid_attrs)
      assert service.price == Decimal.new("120.5")
    end

    test "create_service/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Scheduling.create_service(@invalid_attrs)
    end

    test "update_service/2 with valid data updates the service" do
      service = service_fixture()
      update_attrs = %{price: "456.7"}

      assert {:ok, %Service{} = service} = Scheduling.update_service(service, update_attrs)
      assert service.price == Decimal.new("456.7")
    end

    test "update_service/2 with invalid data returns error changeset" do
      service = service_fixture()
      assert {:error, %Ecto.Changeset{}} = Scheduling.update_service(service, @invalid_attrs)
      assert service == Scheduling.get_service!(service.id)
    end

    test "delete_service/1 deletes the service" do
      service = service_fixture()
      assert {:ok, %Service{}} = Scheduling.delete_service(service)
      assert_raise Ecto.NoResultsError, fn -> Scheduling.get_service!(service.id) end
    end

    test "change_service/1 returns a service changeset" do
      service = service_fixture()
      assert %Ecto.Changeset{} = Scheduling.change_service(service)
    end
  end

  describe "appointments" do
    alias BackendSalon.Scheduling.Appointment

    import BackendSalon.SchedulingFixtures

    @invalid_attrs %{customer_name: nil, service_name: nil, appointment_time: nil}

    test "list_appointments/0 returns all appointments" do
      appointment = appointment_fixture()
      assert Scheduling.list_appointments() == [appointment]
    end

    test "get_appointment!/1 returns the appointment with given id" do
      appointment = appointment_fixture()
      assert Scheduling.get_appointment!(appointment.id) == appointment
    end

    test "create_appointment/1 with valid data creates a appointment" do
      valid_attrs = %{customer_name: "some customer_name", service_name: "some service_name", appointment_time: ~U[2025-02-04 19:00:00Z]}

      assert {:ok, %Appointment{} = appointment} = Scheduling.create_appointment(valid_attrs)
      assert appointment.customer_name == "some customer_name"
      assert appointment.service_name == "some service_name"
      assert appointment.appointment_time == ~U[2025-02-04 19:00:00Z]
    end

    test "create_appointment/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Scheduling.create_appointment(@invalid_attrs)
    end

    test "update_appointment/2 with valid data updates the appointment" do
      appointment = appointment_fixture()
      update_attrs = %{customer_name: "some updated customer_name", service_name: "some updated service_name", appointment_time: ~U[2025-02-05 19:00:00Z]}

      assert {:ok, %Appointment{} = appointment} = Scheduling.update_appointment(appointment, update_attrs)
      assert appointment.customer_name == "some updated customer_name"
      assert appointment.service_name == "some updated service_name"
      assert appointment.appointment_time == ~U[2025-02-05 19:00:00Z]
    end

    test "update_appointment/2 with invalid data returns error changeset" do
      appointment = appointment_fixture()
      assert {:error, %Ecto.Changeset{}} = Scheduling.update_appointment(appointment, @invalid_attrs)
      assert appointment == Scheduling.get_appointment!(appointment.id)
    end

    test "delete_appointment/1 deletes the appointment" do
      appointment = appointment_fixture()
      assert {:ok, %Appointment{}} = Scheduling.delete_appointment(appointment)
      assert_raise Ecto.NoResultsError, fn -> Scheduling.get_appointment!(appointment.id) end
    end

    test "change_appointment/1 returns a appointment changeset" do
      appointment = appointment_fixture()
      assert %Ecto.Changeset{} = Scheduling.change_appointment(appointment)
    end
  end
end
