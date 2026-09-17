# Database Design Notes

## Why separate tables?

The database separates patients, doctors, departments, appointments, treatments, and bills so each real-world concept is stored once and linked through keys. This reduces duplicated data and makes updates safer.

## Primary Key

A **primary key** uniquely identifies a row. Example: `patient_id` uniquely identifies each patient.

## Foreign Key

A **foreign key** links one table to another. Example: `appointments.patient_id` points to `patients.patient_id`.

## Main Relationships

- One department can have many doctors.
- One doctor can have many appointments.
- One patient can have many appointments.
- One appointment can have a treatment record.
- One patient can have many bills.

## Normalization

This design follows basic normalization principles by avoiding repeated doctor, department, and patient details inside the appointment table. Instead, appointments store IDs and reference the original records.

## Indexes

Indexes were added on doctor/date combinations for appointment lookups and on bill payment status for faster filtering of pending bills.

## Interview Talking Point

If asked why not store everything in one big table, explain that doing so would duplicate patient and doctor information across many rows, increase update errors, and make the database harder to maintain. A relational design separates entities and connects them with keys.
