# HealthConnect Rwanda | Week 8 Task 6

**Data Analytics · Appointment Patterns and Attendance**

The appointment extract contains **5,000 distinct bookings** for **4,443 patients**, with dates from **1 January to 28 December 2026**. Monthly counts varied by only 40 bookings. The file records booking activity but has no attendance outcome, so the no-show rate is **unavailable**.

## Recorded Bookings by Month

| Month in the 2026 extract | Recorded bookings |
| --- | ---: |
| January | 418 |
| February | 413 |
| March | 440 |
| April | 405 |
| May | 400 |
| June | 437 |
| July | 416 |
| August | 428 |
| September | 408 |
| October | 414 |
| November | 420 |
| December | 401 |
| **Total** | **5,000** |

March had the most recorded bookings (**440**) and May the fewest (**400**). The visit mix was almost evenly split: **1,694 follow-ups (33.9%)**, **1,656 consultations (33.1%)** and **1,650 emergency bookings (33.0%)**. Of the patients in the extract, **510 (11.5%)** appeared on more than one booking. These figures describe workload in the supplied file. They do not show who attended or establish seasonal demand.

## Why Missed Appointments Cannot Be Measured

The file includes appointment, patient, doctor, facility and department IDs, a date, and a visit type. It has no field for attended, missed, cancelled or rescheduled. The **55,000 billing rows** without a matching appointment point to a gap between the files. They cannot identify missed visits. The separate Revenue Summary reports **60,809 appointments** in aggregate, with no individual booking IDs or outcomes to resolve that gap.

**What to capture next:** Record the scheduled time and final outcome for each booking. A starting no-show measure is **missed ÷ (attended + missed)** among eligible bookings that have passed their scheduled time and have a known outcome. Track cancellations, reschedules and unknown outcomes separately, and report the percentage with a recorded outcome alongside the rate.

**Presentation takeaway:** “Our appointment extract shows about 400 to 440 bookings per month. To understand missed visits or test whether reminders help, we first need to record what happened to each booking.”

**Evidence:** AnalystLab Africa Week 8 guide, Data Analytics task 6 (p. 6); supplied Appointment, Billing and Revenue Summary extracts; and the appointment chart in my Task 5 report. Monthly counts group the recorded dates, and repeat bookings use distinct Patient IDs.
