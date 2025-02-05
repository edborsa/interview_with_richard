// src/types/appointments.ts
export interface Salon {
 id: string;
 name: string;
 location: string;
}

export interface Service {
 id: string;
 name: string;
 price: string;
 salon: Salon;
}

export interface Appointment {
 id: string;
 customerName: string;
 appointmentTime: string;
 salon: Salon;
 service: Service;
}
