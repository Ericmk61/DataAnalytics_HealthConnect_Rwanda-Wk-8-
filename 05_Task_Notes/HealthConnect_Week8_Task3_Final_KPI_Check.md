# HealthConnect Rwanda | Week 8 Task 3

**Data Analytics · Confirm the Final KPIs**

These are the six executive figures with dashboard filters cleared. Each figure describes its own source population. The evidence column identifies how the value or its definition was checked.

| Executive KPI | Final value | Definition | Evidence |
| --- | ---: | --- | --- |
| Registered patients | **20,000** | Distinct patient IDs in the patient register. | SQL and Power BI count matched in the recorded comparison. |
| Recorded appointments | **5,000** | Distinct appointment IDs in the supplied appointment file. The file records bookings without attendance outcomes. | SQL and Power BI count matched in the recorded comparison. |
| Facilities | **20** | Distinct facility IDs, counted once even when a facility has multiple department or bed records. | Source count and reported dashboard count agreed. |
| Doctors | **350** | Distinct nonblank staff IDs where Role is Doctor, using the final DAX measure. | The staff source count and reviewed DAX support 350. The earlier appointment-based doctor count also returned 350, but it measures doctors represented in bookings. |
| Collected revenue | **RWF 8,389,454,556** | Sum of `AmountPaid` in Payments. Includes payments that could not be assigned to a facility. | Source sum matched the exact Power BI card shown in the screenshot. |
| Average patient satisfaction | **2.99 / 5** | Mean of Rating across **21,064** recorded feedback responses, rounded to two decimals. | Source calculation, reviewed DAX and reported dashboard value agree. The earlier MySQL feedback query was not successfully rerun in the documented checks. |

## Financial Reconciliation

The executive **Collected Revenue** card uses the Payments file. The separate **Reported Revenue** figure is **RWF 1,132,677,500**, summed from the 12 monthly Revenue Summary rows. These measures have different sources and cannot be reconciled from the available records.

| Finance measure | Value |
| --- | ---: |
| Total billed | RWF 9,309,401,961 |
| Collected payments | RWF 8,389,454,556 |
| Outstanding billing balance | RWF 919,947,405 |
| Collections linked to a recorded appointment | RWF 694,551,320 (8.28%) |
| Collections without an appointment link | RWF 7,694,903,236 (91.72%) |

The linked and unlinked amounts add to total collections. The corrected dashboard keeps the unlinked amount visible in the **(Blank)** group. Named facility and department bars show only the linked portion. The outstanding balance is billed less collected; the figures do not establish how much is overdue or whether the clinic made a profit or loss.

**Evidence:** AnalystLab Africa Week 8 guide, Data Analytics task 2 (p. 6); my Week 7 Testing Record (T01a–T01f), reviewed Power BI measure definitions, Power BI checks P01–P03, source verification results, and Week 8 check of the saved dashboard.
