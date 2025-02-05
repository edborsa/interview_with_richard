defmodule BackendSalon.Scheduling do
  @moduledoc """
  The Scheduling context.
  """

  import Ecto.Query, warn: false
  alias BackendSalon.Repo

  alias BackendSalon.Scheduling.Salon

  @doc """
  Returns the list of salons.

  ## Examples

      iex> list_salons()
      [%salons{}, ...]

  """
  def list_salons do
    Repo.all(Salon)
  end

  @doc """
  Gets a single salons.

  Raises `Ecto.NoResultsError` if the salons does not exist.

  ## Examples

      iex> get_salons!(123)
      %salons{}

      iex> get_salons!(456)
      ** (Ecto.NoResultsError)

  """
  def get_salons!(id), do: Repo.get!(Salon, id)

  @doc """
  Creates a salons.

  ## Examples

      iex> create_salons(%{field: value})
      {:ok, %salons{}}

      iex> create_salons(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_salon(attrs \\ %{}) do
    %Salon{}
    |> Salon.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a salons.

  ## Examples

      iex> update_salons(salons, %{field: new_value})
      {:ok, %salons{}}

      iex> update_salons(salons, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_salons(%Salon{} = salon, attrs) do
    salon
    |> Salon.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a salons.

  ## Examples

      iex> delete_salons(salons)
      {:ok, %salons{}}

      iex> delete_salons(salons)
      {:error, %Ecto.Changeset{}}

  """
  def delete_salons(%Salon{} = salon) do
    Repo.delete(salon)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking salons changes.

  ## Examples

      iex> change_salons(salons)
      %Ecto.Changeset{data: %salons{}}

  """
  def change_salons(%Salon{} = salons, attrs \\ %{}) do
    Salon.changeset(salons, attrs)
  end

  alias BackendSalon.Scheduling.Service

  @doc """
  Returns the list of services.

  ## Examples

      iex> list_services()
      [%Service{}, ...]

  """
  def list_services do
    Repo.all(Service)
  end

  @doc """
  Gets a single service.

  Raises `Ecto.NoResultsError` if the Service does not exist.

  ## Examples

      iex> get_service!(123)
      %Service{}

      iex> get_service!(456)
      ** (Ecto.NoResultsError)

  """
  def get_service!(id), do: Repo.get!(Service, id)

  @doc """
  Creates a service.

  ## Examples

      iex> create_service(%{field: value})
      {:ok, %Service{}}

      iex> create_service(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_service(attrs \\ %{}) do
    %Service{}
    |> Service.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a service.

  ## Examples

      iex> update_service(service, %{field: new_value})
      {:ok, %Service{}}

      iex> update_service(service, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_service(%Service{} = service, attrs) do
    service
    |> Service.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a service.

  ## Examples

      iex> delete_service(service)
      {:ok, %Service{}}

      iex> delete_service(service)
      {:error, %Ecto.Changeset{}}

  """
  def delete_service(%Service{} = service) do
    Repo.delete(service)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking service changes.

  ## Examples

      iex> change_service(service)
      %Ecto.Changeset{data: %Service{}}

  """
  def change_service(%Service{} = service, attrs \\ %{}) do
    Service.changeset(service, attrs)
  end

  alias BackendSalon.Scheduling.Appointment

  @doc """
  Returns the list of appointments.

  ## Examples

      iex> list_appointments()
      [%Appointment{}, ...]

  """
  def list_appointments do
    Repo.all(Appointment)
  end

  @doc """
  Gets a single appointment.

  Raises `Ecto.NoResultsError` if the Appointment does not exist.

  ## Examples

      iex> get_appointment!(123)
      %Appointment{}

      iex> get_appointment!(456)
      ** (Ecto.NoResultsError)

  """
  def get_appointment!(id), do: Repo.get!(Appointment, id)

  @doc """
  Creates a appointment.

  ## Examples

      iex> create_appointment(%{field: value})
      {:ok, %Appointment{}}

      iex> create_appointment(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_appointment(attrs \\ %{}) do
    %Appointment{}
    |> Appointment.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a appointment.

  ## Examples

      iex> update_appointment(appointment, %{field: new_value})
      {:ok, %Appointment{}}

      iex> update_appointment(appointment, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_appointment(%Appointment{} = appointment, attrs) do
    appointment
    |> Appointment.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a appointment.

  ## Examples

      iex> delete_appointment(appointment)
      {:ok, %Appointment{}}

      iex> delete_appointment(appointment)
      {:error, %Ecto.Changeset{}}

  """
  def delete_appointment(%Appointment{} = appointment) do
    Repo.delete(appointment)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking appointment changes.

  ## Examples

      iex> change_appointment(appointment)
      %Ecto.Changeset{data: %Appointment{}}

  """
  def change_appointment(%Appointment{} = appointment, attrs \\ %{}) do
    Appointment.changeset(appointment, attrs)
  end
end
