USE hospital_management;

CREATE OR REPLACE VIEW patient_appointment_summary AS
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
JOIN departments dep ON d.department_id = dep.department_id;

CREATE OR REPLACE VIEW pending_bills AS
SELECT
    b.bill_id,
    p.patient_name,
    b.amount,
    b.bill_date
FROM bills b
JOIN patients p ON b.patient_id = p.patient_id
WHERE b.payment_status = 'Pending';
