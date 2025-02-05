// src/components/AppointmentForm.tsx
'use client';

import { gql, useMutation, useQuery } from '@apollo/client';
import { useState } from 'react';

const GET_SALONS_AND_SERVICES = gql`
 query {
   salons {
     id
     name
     services {
       id
       name
       price
     }
   }
 }
`;

const CREATE_APPOINTMENT = gql`
  mutation CreateAppointment(
    $customerName: String!
    $appointmentTime: Datetime!  # Changed from DateTime to Datetime
    $salonId: ID!
    $serviceId: ID!
  ) {
    createAppointment(
      customerName: $customerName
      appointmentTime: $appointmentTime
      salonId: $salonId
      serviceId: $serviceId
    ) {
      id
      customerName
      appointmentTime
      salon { name }
      service { name price }
    }
  }
`;

export default function AppointmentForm() {
 const { data: salonsData } = useQuery(GET_SALONS_AND_SERVICES);
 const [selectedSalon, setSelectedSalon] = useState('');
 const [formData, setFormData] = useState({
   customerName: '',
   appointmentTime: '',
   salonId: '',
   serviceId: ''
 });

 const [createAppointment] = useMutation(CREATE_APPOINTMENT, {
   refetchQueries: ['GetAppointments']
 });

const handleSubmit = async (e: React.FormEvent) => {
  e.preventDefault();
  try {
    // Convert local datetime to ISO string
    const appointmentDateTime = new Date(formData.appointmentTime).toISOString();

    await createAppointment({
      variables: {
        ...formData,
        appointmentTime: appointmentDateTime
      }
    });

    setFormData({
      customerName: '',
      appointmentTime: '',
      salonId: '',
      serviceId: ''
    });
    setSelectedSalon('');
  } catch (error) {
    console.error('Error creating appointment:', error);
  }
};

 return (
   <form onSubmit={handleSubmit} className="space-y-4 max-w-md">
     <input
       type="text"
       placeholder="Customer Name"
       value={formData.customerName}
       onChange={(e) => setFormData({...formData, customerName: e.target.value})}
       className="w-full p-2 border rounded"
     />
     <input
       type="datetime-local"
       value={formData.appointmentTime}
       onChange={(e) => setFormData({...formData, appointmentTime: e.target.value})}
       className="w-full p-2 border rounded"
     />
     <select
       value={selectedSalon}
       onChange={(e) => {
         setSelectedSalon(e.target.value);
         setFormData({...formData, salonId: e.target.value, serviceId: ''});
       }}
       className="w-full p-2 border rounded"
     >
       <option value="">Select Salon</option>
       {salonsData?.salons?.map((salon) => (
         <option key={salon.id} value={salon.id}>
           {salon.name}
         </option>
       ))}
     </select>

     <select
       value={formData.serviceId}
       onChange={(e) => setFormData({...formData, serviceId: e.target.value})}
       className="w-full p-2 border rounded"
       disabled={!selectedSalon}
     >
       <option value="">Select Service</option>
       {salonsData?.salons
         ?.find(s => s.id === selectedSalon)
         ?.services?.map((service) => (
           <option key={service.id} value={service.id}>
             {service.name} (${service.price})
           </option>
       ))}
     </select>

     <button 
       type="submit" 
       className="w-full p-2 bg-blue-500 text-white rounded hover:bg-blue-600"
       disabled={!formData.customerName || !formData.appointmentTime || !formData.salonId || !formData.serviceId}
     >
       Create Appointment
     </button>
   </form>
 );
}
