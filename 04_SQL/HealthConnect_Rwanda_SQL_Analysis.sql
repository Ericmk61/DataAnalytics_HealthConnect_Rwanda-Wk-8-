CREATE DATABASE rwanda_healthcare;
USE rwanda_healthcare;

-- Patient analysis
-- 1. Retrieve all registered patients
SELECT *
FROM patients;

-- 2. Count patients by gender
SELECT Gender, COUNT(*)  as Total_patients
FROM patients
GROUP BY gender;

-- 3. Count patients by province
SELECT l.provincename, COUNT(*) as Total_patients
FROM patients as p
INNER JOIN location as l
ON p.villageid = l.villageid
GROUP BY  provincename;

-- 4. Identify patients above 65 years
SELECT *
FROM patients
WHERE age >= 65;

-- 5. Find patients with chronic diseases
SELECT *
FROM patients
WHERE chroniccondition != "None"; 

-- 6. Retrieve patients covered by insurance
SELECT *
FROM patients
WHERE insuranceid IS NOT NULL;

-- 7. Count patients by blood group.
SELECT BloodGroup, COUNT(*) AS patientbloodwork
FROM patients
GROUP BY BloodGroup
ORDER BY patientbloodwork DESC;

-- 8. List the youngest and oldest patients
SELECT * ,
CASE
        WHEN Age = (SELECT MIN(Age) FROM patients)
            THEN 'Youngest'
        WHEN Age = (SELECT MAX(Age) FROM patients)
            THEN 'Oldest'
    END AS age_rank
FROM patients  
WHERE Age = (SELECT MIN(Age) FROM patients)
   OR Age = (SELECT MAX(Age) FROM patients)
ORDER BY Age;

-- 9. Identify duplicate phone numbers
SELECT phone , count(phone) as count
FROM patients
GROUP BY phone
having count > 1; 

-- 10. Calculate average patient age.
SELECT round(avg(age)) as Average_age
FROM patients;

-- Appointment Analysis 
-- 11. Count appointments by month
SELECT
    MONTHNAME(Date) AS Month,
    COUNT(AppointmentID) AS Total_Appointments
FROM appointments
GROUP BY MONTH(Date), Month
ORDER BY MONTH(Date);

-- 12. Identify busiest hospitals
SELECT Facilityid, count(*) as patients
FROM appointments
GROUP BY Facilityid
ORDER BY patients DESC;

-- 13. Find busiest departments
SELECT departmentid, count(*) as patients
FROM appointments
GROUP BY departmentid
ORDER BY patients DESC;

-- 14. Find doctors with the highest workload.
SELECT doctorid, count(*) as patients
FROM appointments
GROUP BY doctorid
ORDER BY patients DESC;
SET SQL_SAFE_UPDATES = 1;
-- 15. Identify referral patterns
SELECT a.FacilityID as original, r.ReferredFacilityID as destination, count(*) as referral_count
FROM referrals as r
LEFT JOIN appointments as a
ON r.AppointmentID = a.AppointmentID
GROUP BY original, destination
ORDER BY referral_count DESC;

-- 16. Count emergency appointments
SELECT VisitType, count(*) 
FROM appointments
WHERE VisitType ='Emergency';

-- 17. Calculate average appointments per doctor 
SELECT ROUND( count(appointmentid) / count(distinct Doctorid) ) AS avgapp_doctor
FROM appointments;

-- 18. Retrieve appointments by province
SELECT l.Provincename as province, count(a.appointmentid) AS Appointments
FROM appointments AS a
LEFT JOIN patients AS p
ON a.patientid = p.ï»¿PatientID
LEFT JOIN location AS l
ON p.villageid = l.villageid
GROUP BY province
ORDER BY province;

-- 19. Identify facilities with the highest patient volume.
SELECT Facilityid, count(distinct patientid) AS patient_volume
FROM appointments
GROUP BY Facilityid
ORDER BY patient_volume DESC;

-- 20. Find peak consultation periods
SELECT monthname(Date) as month ,count(AppointmentID) as total_appointments
FROM appointments
WHERE  VisitType="Consultation"
GROUP BY month
ORDER BY total_appointments desc
LIMIT 6;

-- Clinical Analysis 
-- 21. Top diagnoses
SELECT diagnosis, count(*)
FROM diagnoses
GROUP BY diagnosis;

-- 22. Most requested laboratory tests. 
SELECT test, count(*)
FROM labtests
GROUP BY test;

-- 23. Most prescribed medications.
SELECT medication, count(*)
FROM prescriptions
GROUP BY medication;

-- 24. Average admission duration
SELECT round(avg(lengthofstaydays)) AS average_admission_duration
FROM admissions;

-- 25. Disease severity distribution
SELECT severity, count(*)
FROM diagnoses
GROUP BY severity;

-- 26. Laboratory test utilization
SELECT
    Test,
    COUNT(*) AS test_count,
    ROUND( 100.0 * COUNT(*) / (SELECT COUNT(*) FROM labtests), 2) AS usage_percentage
FROM labtests
GROUP BY Test
ORDER BY test_count DESC;

-- 27. Prescription trends
select monthname(Date) as month ,count(*) as prescription_count
FROM prescriptions p
LEFT JOIN appointments a
    ON p.AppointmentID = a.AppointmentID
GROUP BY MONTH(Date), month
ORDER BY MONTH(Date);

-- 28. Referral destinations
SELECT
    ReferredFacilityID,
    COUNT(*) AS referral_count
FROM referrals
GROUP BY ReferredFacilityID
ORDER BY referral_count DESC, ReferredFacilityID;

-- 29. Admission rate by diagnosis
SELECT
    d.Diagnosis,
    COUNT(DISTINCT a.AppointmentID)
        AS appointments_with_diagnosis,
    COUNT(DISTINCT ad.AppointmentID)
        AS admitted_appointments,
    ROUND(
        100.0 * COUNT(DISTINCT ad.AppointmentID) /
        COUNT(DISTINCT a.AppointmentID),
        2
    ) AS admission_rate_pct
FROM diagnoses d
JOIN appointments a
    ON d.AppointmentID = a.AppointmentID
LEFT JOIN admissions ad
    ON a.AppointmentID = ad.AppointmentID
GROUP BY d.Diagnosis
ORDER BY admission_rate_pct DESC;

-- 30. Clinical workload by department
SELECT
    COALESCE(dep.DepartmentName, 'Unknown') AS department,
    e.record_type,
    COUNT(*) AS record_count
FROM (
    SELECT AppointmentID, 'Diagnosis' AS record_type
    FROM diagnoses

    UNION ALL

    SELECT AppointmentID, 'Lab test'
    FROM labtests

    UNION ALL

    SELECT AppointmentID, 'Prescription'
    FROM prescriptions

    UNION ALL

    SELECT AppointmentID, 'Admission'
    FROM admissions
) AS e
LEFT JOIN appointments a
    ON e.AppointmentID = a.AppointmentID
LEFT JOIN (
    SELECT DISTINCT DepartmentID, DepartmentName
    FROM facilities
) AS dep
    ON a.DepartmentID = dep.DepartmentID
GROUP BY department, e.record_type
ORDER BY department, e.record_type;

-- Financial Analysis
-- 31. Revenue by facility
SELECT
    COALESCE(a.FacilityID, 'Unknown') AS facility_id,
    SUM(p.AmountPaid) AS collected_revenue
FROM payments p
LEFT JOIN billing AS b
    ON p.BillingID = b.ï»¿BillingID
LEFT JOIN appointments AS a
    ON b.AppointmentID = a.AppointmentID
GROUP BY a.FacilityID
ORDER BY collected_revenue DESC;

-- 32. Revenue by department
SELECT
    COALESCE(a.DepartmentID, 'Unknown') AS department_id,
    SUM(p.AmountPaid) AS collected_revenue
FROM payments p
LEFT JOIN billing b
    ON p.BillingID = b.ï»¿BillingID
LEFT JOIN appointments a
    ON b.AppointmentID = a.AppointmentID
GROUP BY a.DepartmentID
ORDER BY collected_revenue DESC;

-- 33. Revenue by service
-- Can't be deterined since there is no connection between services & revenue 

-- 34. Insurance claims by provider
SELECT
    Provider,
    COUNT(*) AS claim_count,
    ROUND(SUM(ClaimAmount), 2) AS total_claimed
FROM insurance_claims
GROUP BY Provider
ORDER BY total_claimed DESC;

-- 35. Outstanding payments
SELECT
    b.ï»¿BillingID,
    b.Amount AS billed_amount,
    COALESCE(p.total_paid, 0) AS amount_paid,
    b.Amount - COALESCE(p.total_paid, 0) AS outstanding_amount
FROM billing b
LEFT JOIN (
    SELECT
        BillingID,
        SUM(AmountPaid) AS total_paid
    FROM payments
    GROUP BY BillingID
) AS p
    ON b.ï»¿BillingID = p.BillingID
WHERE b.Amount > COALESCE(p.total_paid, 0)
ORDER BY outstanding_amount DESC;

-- 36. Average billing amount
SELECT
    ROUND(AVG(Amount), 2) AS average_billing_amount
FROM billing;

-- 37. Monthly revenue trend 
SELECT
    ï»¿Month,
    Revenue
FROM revenue
ORDER BY ï»¿Month;

-- 38. Payment methods
SELECT
    Method,
    COUNT(*) AS payment_count,
    SUM(AmountPaid) AS total_paid
FROM payments
GROUP BY Method
ORDER BY total_paid DESC;

-- 39. Top revenue-generating hospitals
SELECT
    a.FacilityID,
    SUM(p.AmountPaid) AS collected_revenue
FROM payments p
JOIN billing b
    ON p.BillingID = b.ï»¿BillingID
JOIN appointments a
    ON b.AppointmentID = a.AppointmentID
GROUP BY a.FacilityID
ORDER BY collected_revenue DESC
LIMIT 10;

-- 40. Financial performance ranking
SELECT
    f.*,
    DENSE_RANK() OVER (
        ORDER BY f.collected_revenue DESC
    ) AS revenue_rank
FROM (
    SELECT
        a.FacilityID,
        SUM(b.Amount) AS total_billed,
        SUM(COALESCE(p.AmountPaid, 0)) AS collected_revenue,
        SUM(
            b.Amount - COALESCE(p.AmountPaid, 0)
        ) AS outstanding_amount
    FROM billing b
    JOIN appointments a
        ON b.AppointmentID = a.AppointmentID
    LEFT JOIN payments p
        ON b.ï»¿BillingID = p.BillingID
    GROUP BY a.FacilityID
) f
ORDER BY revenue_rank, FacilityID;