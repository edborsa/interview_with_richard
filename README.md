# BackendSalon


## Setup

Run `mix ecto.reset`. 
I included some data in seeds.exs in order to be easier to test the code.

Graph QL Query Examples:

```graphql
# LIST APPOINTMENTS 
query{
  appointments {
    id,
    ... ANY OTHER FIELDS
  }
}

# CREATE APPOINTMENT
mutation{
  createAppointment(
    appointmentTime: "2025-02-05 19:26:39.748664Z",
    salonId: SALON_ID
    customerName: "Ed Borsa",
    serviceId: SERVICE_ID
  ) {
    id,
    ... ANY OTHER FIELDS
  }
}

#UPDATE APPOINTMENT
mutation{
  updateAppointment(
    id: "bfaba297-b572-48ca-a975-21755016da44",
    appointmentTime: "2025-02-05 19:26:39.748664Z",
    salonId: SALON_OID
    customerName: "Ed Borsa 2",
    serviceId: SERVICE_ID
  ) {
    id,
    customerName,
    ... ANY OTHER FIELDS
    
  }
}

#UPDATE DELETE APPOINTMENT
mutation{
  deleteAppointment(
    id: $APPOINTMENT_ID
  ) {
    id,
    customerName,
    ... ANY OTHER FIELDS
    
  }
}
```
