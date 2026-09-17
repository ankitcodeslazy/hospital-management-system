USE hospital_management;

-- 1. Patient appointment history with doctor and department
SELECT
    a.appointment_id,
    p.patient_name,
    d.doctor_name,
    dep.department_name,
    a.appointment_date,
    a.status,
    a.reason
FROM appointments a
JOIN patients p ON a.patient_id = p.patient_id
JOIN doctors d ON a.doctor_id = d.doctor_id
JOIN departments dep ON d.department_id = dep.department_id
ORDER BY a.appointment_date DESC;

-- 2. Doctor workload: number of appointments per doctor
SELECT
    d.doctor_name,
    COUNT(a.appointment_id) AS appointment_count
FROM doctors d
LEFT JOIN appointments a ON d.doctor_id = a.doctor_id
GROUP BY d.doctor_id, d.doctor_name
ORDER BY appointment_count DESC;

-- 3. Department revenue from bills
SELECT
    dep.department_name,
    ROUND(SUM(b.amount), 2) AS total_billed
FROM bills b
JOIN appointments a ON b.appointment_id = a.appointment_id
JOIN doctors d ON a.doctor_id = d.doctor_id
JOIN departments dep ON d.department_id = dep.department_id
GROUP BY dep.department_id, dep.department_name
ORDER BY total_billed DESC;

-- 4. Unpaid bills
SELECT
    b.bill_id,
    p.patient_name,
    b.amount,
    b.bill_date
FROM bills b
JOIN patients p ON b.patient_id = p.patient_id
WHERE b.payment_status = 'Pending'
ORDER BY b.amount DESC;

-- 5. Patients with more than one appointment
SELECT
    p.patient_name,
    COUNT(a.appointment_id) AS total_appointments
FROM patients p
JOIN appointments a ON p.patient_id = a.patient_id
GROUP BY p.patient_id, p.patient_name
HAVING COUNT(a.appointment_id) > 1;

-- 6. Average treatment cost by department
SELECT
    dep.department_name,
    ROUND(AVG(t.treatment_cost), 2) AS avg_treatment_cost
FROM treatments t
JOIN appointments a ON t.appointment_id = a.appointment_id
JOIN doctors d ON a.doctor_id = d.doctor_id
JOIN departments dep ON d.department_id = dep.department_id
GROUP BY dep.department_id, dep.department_name
ORDER BY avg_treatment_cost DESC;

-- 7. CTE: rank doctors by appointment volume
WITH doctor_activity AS (
    SELECT
        d.doctor_id,
        d.doctor_name,
        COUNT(a.appointment_id) AS appointment_count
    FROM doctors d
    LEFT JOIN appointments a ON d.doctor_id = a.doctor_id
    GROUP BY d.doctor_id, d.doctor_name
)
SELECT
    doctor_name,
    appointment_count,
    RANK() OVER (ORDER BY appointment_count DESC) AS workload_rank
FROM doctor_activity;

-- 8. Most common diagnoses
SELECT
    diagnosis,
    COUNT(*) AS diagnosis_count
FROM treatments
GROUP BY diagnosis
ORDER BY diagnosis_count DESC, diagnosis;

-- 9. Subquery: patients whose bill is above the average bill amount
SELECT
    p.patient_name,
    b.amount
FROM bills b
JOIN patients p ON b.patient_id = p.patient_id
WHERE b.amount > (
    SELECT AVG(amount)
    FROM bills
)
ORDER BY b.amount DESC;

-- 10. Upcoming scheduled appointments
SELECT
    p.patient_name,
    d.doctor_name,
    a.appointment_date,
    a.reason
FROM appointments a
JOIN patients p ON a.patient_id = p.patient_id
JOIN doctors d ON a.doctor_id = d.doctor_id
WHERE a.status = 'Scheduled'
ORDER BY a.appointment_date;
