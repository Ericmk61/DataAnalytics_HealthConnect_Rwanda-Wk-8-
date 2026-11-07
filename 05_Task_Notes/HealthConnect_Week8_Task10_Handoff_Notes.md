# HealthConnect Rwanda | Week 8 Task 10

**Data Analytics · Findings for Data Science and Project Management**

The dashboard can support an overall review of recorded bookings, collections and feedback. To use these findings for a no-show model or facility comparisons, the receiving tracks need to know what the records cover and where the gaps are.

| Intended track | Findings and evidence to hand over | What the receiving track would confirm |
| --- | --- | --- |
| **Data Science** | The appointment extract has **5,000 distinct bookings** and no attendance outcome. Only **5,000 of 60,000 billing rows** match a booking in the extract. A missing link does not show that a patient missed an appointment. See the Task 6 appointment analysis. | Identify an authoritative outcome source that can be matched by Appointment ID. Agree on which bookings count in the no-show rate and check outcome coverage by facility and period before using the data to evaluate a model. If prediction is meant to happen before an appointment, use only information available at the time of prediction. |
| **Project Management** | Overall collections were **RWF 8,389,454,556**. Only **8.28%** of payment value links to an appointment; **RWF 7,694,903,236** remains unattributed. Satisfaction averaged **2.99 out of 5** across **21,064 responses**, of which **8.34%** linked to an appointment. See Tasks 3 and 9. | Confirm who owns the appointment register and whether a more complete export can be obtained. Use the overall figures and explain the limited coverage of facility comparisons. Prioritise capturing appointment outcomes and fixing broken links. |

**Validation example for the handoff:** In the corrected Power BI dashboard, I confirmed **HF006 at RWF 40,224,830** and **DEP181 at RWF 5,681,113** against source totals. I also confirmed that the facility filter changed the financial charts and that clearing it restored the original view. These checks support the sampled figures and filter behaviour. They do not resolve the missing appointment links. See Task 4 for the check record.

**Status:** Handoff notes prepared. No cross-track exchange or joint validation was recorded.

**Evidence:** AnalystLab Africa Week 8 guide, Data Analytics task 10 and sections 9–10; my Task 3 KPI checks, Task 4 dashboard validation, Task 6 appointment analysis and Task 9 decision brief.
