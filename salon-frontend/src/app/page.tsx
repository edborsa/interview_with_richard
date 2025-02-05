// src/app/page.tsx
'use client';

import { gql, useQuery, useMutation } from '@apollo/client';
import AppointmentForm from '@/components/AppointmentForm';
import { Appointment } from '@/types/appointments';

const GET_APPOINTMENTS = gql`
 query GetAppointments {
   appointments {
     id
     customerName
     appointmentTime
     salon {
       name
     }
     service {
       name
       price
     }
   }
 }
`;

const DELETE_APPOINTMENT = gql`
  mutation DeleteAppointment($id: ID!) {
    deleteAppointment(id: $id) {
      id
    }
  }
`;

export default function AppointmentsPage() {
  const { loading, error, data } = useQuery(GET_APPOINTMENTS);
  const [deleteAppointment] = useMutation(DELETE_APPOINTMENT, {
    refetchQueries: ['GetAppointments']
  });

  if (loading) return <div>Loading...</div>;
  if (error) return <div>Error: {error.message}</div>;

  const handleDelete = async (id: string) => {
    if (confirm('Are you sure you want to delete this appointment?')) {
      try {
        await deleteAppointment({
          variables: { id }
        });
      } catch (error) {
        console.error('Error deleting appointment:', error);
      }
    }
  };


  return (
    <div className="container mx-auto p-6">
      <h1 className="text-2xl font-bold mb-6">Salon Appointments</h1>

      <div className="mb-8">
        <h2 className="text-xl font-semibold mb-4">New Appointment</h2>
        <AppointmentForm />
      </div>

      <div className="grid gap-4 md:grid-cols-2 lg:grid-cols-3">
        {data.appointments.map((appointment: Appointment) => (
          <div key={appointment.id} className="p-4 border rounded shadow">
            <h2 className="font-semibold">{appointment.customerName}</h2>
            <p>Salon: {appointment.salon.name}</p>
            <p>Service: {appointment.service.name} (${appointment.service.price})</p>
            <p>Time: {new Date(appointment.appointmentTime).toLocaleString()}</p>
            <button
              onClick={() => handleDelete(appointment.id)}
              className="mt-2 px-3 py-1 bg-red-500 text-white rounded hover:bg-red-600"
            >
              Delete
            </button>
          </div>
        ))}
      </div>
    </div>
  );
}
