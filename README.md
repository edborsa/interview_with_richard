# BackendSalon

## Table of contents

- [Setup](#setup)
  - [Backend](#backend)
    - [Graph QL Examples](#graph-ql-examples)
  - [Frontend](#fronted)


## Setup

### Backend:

Run `mix ecto.reset` to include some data
Run `iex -S mix phx.server` to start the application

Obs: I included some data in seeds.exs in order to be easier to test the code.

#### Graph QL Examples:

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
    id: $APPOINTMENT_ID,
    appointmentTime: "2025-02-05 19:26:39.748664Z",
    salonId: SALON_ID
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

### Frontend:

The frontend is located inside the `salon-client` folder.

Node version: 22.13.1

Run: `npm run dev` to start the frontend
