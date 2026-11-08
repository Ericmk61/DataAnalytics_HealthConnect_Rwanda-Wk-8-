# HealthConnect Rwanda Healthcare Analytics

## Week 8 Upgrade

This repository contains the Week 8 version of the HealthConnect Rwanda Data Analytics project, developed as part of AnalystLab Africa.

It builds on the SQL analysis, Power BI dashboard testing and refinements completed in Week 7. This upgrade brings the validated findings together in a final analytics report, executive summary, business recommendations and presentation.

## Progression from Week 7

Week 7 focused on checking KPI definitions and source totals, correcting financial chart grouping, and testing dashboard filters.

Week 8 develops that foundation through:

- A final KPI summary with clear definitions and supporting evidence.
- Business insights covering appointment management, patient experience, finances and hospital operations.
- Recommendations informed by the available data.
- A final analytics report, executive summary and presentation.

The [Week 7 testing record](06_Testing_Evidence/HealthConnect_Week7_Testing_Record.md) documents the earlier checks and corrections.

Earlier project versions are available through [my GitHub repositories](https://github.com/Ericmk61?tab=repositories).

## Tools Used

- **Power Query:** Data preparation, table consolidation and data type management.
- **MySQL:** SQL analysis, joins, aggregations and KPI checks.
- **Power BI:** Data modelling, DAX measures, interactive dashboards and filter testing.

## Dashboard Pages

The Power BI report contains six pages:

1. Executive Dashboard
2. Patient Analytics
3. Clinical Analytics
4. Financial Dashboard
5. Operational Dashboard
6. Patient Experience Dashboard

## Key Figures

| Measure | Value |
| --- | ---: |
| Registered patients | 20,000 |
| Recorded appointments | 5,000 |
| Facilities | 20 |
| Doctors in the staff register | 350 |
| Collected payments | RWF 8,389,454,556 |
| Average patient satisfaction | 2.99 out of 5 |

The satisfaction score covers 21,064 recorded feedback responses.

## Business Recommendations

The main appointment recommendation is to capture attendance outcomes consistently, including attended visits, missed appointments, cancellations and reschedules.

A reliable attendance baseline would allow the clinic to evaluate reminder and rescheduling initiatives. Other recommendations include improving appointment links across the financial records and recording feedback submission dates to support analysis over time.

## Repository Structure

| Folder | Contents |
| --- | --- |
| [01_Reports](01_Reports/) | Final analytics report and executive summary |
| [02_Presentation](02_Presentation/) | Project presentation and supporting material |
| [03_Dashboard](03_Dashboard/) | Final Power BI dashboard |
| [04_SQL](04_SQL/) | MySQL analysis script |
| [05_Task_Notes](05_Task_Notes/) | KPI definitions, analysis, recommendations and validation notes |
| [06_Testing_Evidence](06_Testing_Evidence/) | Testing records, screenshots, measure definitions and source verification |

## Main Project Files

- [Final Analytics Report](01_Reports/HealthConnect_Week8_Task5_Final_Analytics_Report.docx)
- [Executive Summary](01_Reports/HealthConnect_Week8_Task14_Executive_Summary.docx)
- [Power BI Dashboard](03_Dashboard/HealthConnect_Rwanda_Week8_Final.pbix)
- [Analytics Presentation](02_Presentation/HealthConnect_Week8_Task12_Analytics_Presentation.pptx)
- [MySQL Analysis](04_SQL/HealthConnect_Rwanda_SQL_Analysis.sql)

## Data Interpretation

- Appointment counts describe recorded bookings. Attendance outcomes are unavailable, so the extract cannot establish a no-show rate.
- Facility and department collections cover payments linked to recorded appointments. Unmatched payments remain included in the overall collections total.
- Collected payments and the monthly Revenue Summary are separate measures with different sources.
- Bed occupancy describes the status snapshot in the supplied records. Assessing capacity over time requires dated occupancy data.

The final report explains the findings, definitions and limitations in more detail.
