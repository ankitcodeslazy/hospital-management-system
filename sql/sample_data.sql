USE hospital_management;

INSERT INTO departments (department_name) VALUES
('Cardiology'),
('Orthopedics'),
('Neurology'),
('General Medicine');

INSERT INTO doctors (doctor_name, specialization, department_id, phone, email) VALUES
('Dr. Meera Sen', 'Cardiologist', 1, '9000000001', 'meera.sen@example.com'),
('Dr. Arjun Rao', 'Orthopedic Surgeon', 2, '9000000002', 'arjun.rao@example.com'),
('Dr. Kavita Iyer', 'Neurologist', 3, '9000000003', 'kavita.iyer@example.com'),
('Dr. Rohan Das', 'Physician', 4, '9000000004', 'rohan.das@example.com');

INSERT INTO patients (patient_name, date_of_birth, gender, phone, city) VALUES
('Amit Kumar', '1998-04-12', 'Male', '8111111111', 'Bhubaneswar'),
('Priya Nair', '2001-09-25', 'Female', '8222222222', 'Cuttack'),
('Rahul Mishra', '1989-01-18', 'Male', '8333333333', 'Puri'),
('Sneha Patel', '1995-06-03', 'Female', '8444444444', 'Bhubaneswar'),
('Vikram Singh', '1978-11-30', 'Male', '8555555555', 'Rourkela');

INSERT INTO appointments (patient_id, doctor_id, appointment_date, status, reason) VALUES
(1, 1, '2026-09-10 10:00:00', 'Completed', 'Chest discomfort'),
(2, 4, '2026-09-11 11:30:00', 'Completed', 'Fever and weakness'),
(3, 2, '2026-09-12 09:00:00', 'Completed', 'Knee pain'),
(4, 3, '2026-09-13 15:00:00', 'Completed', 'Recurring migraine'),
(5, 1, '2026-09-18 10:30:00', 'Scheduled', 'Routine cardiac review'),
(1, 4, '2026-09-20 12:00:00', 'Scheduled', 'General follow-up');

INSERT INTO treatments (appointment_id, diagnosis, treatment_notes, treatment_cost) VALUES
(1, 'Mild hypertension', 'Lifestyle changes and monitoring advised', 2500.00),
(2, 'Viral fever', 'Hydration, rest, and medication', 1200.00),
(3, 'Knee ligament strain', 'Physiotherapy and anti-inflammatory medication', 3500.00),
(4, 'Migraine', 'Medication and trigger tracking recommended', 2200.00);

INSERT INTO bills (patient_id, appointment_id, amount, payment_status, bill_date) VALUES
(1, 1, 3000.00, 'Paid', '2026-09-10'),
(2, 2, 1700.00, 'Paid', '2026-09-11'),
(3, 3, 4200.00, 'Pending', '2026-09-12'),
(4, 4, 2700.00, 'Paid', '2026-09-13'),
(5, 5, 1000.00, 'Pending', '2026-09-18');
