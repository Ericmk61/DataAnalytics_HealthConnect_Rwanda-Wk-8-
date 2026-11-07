# HealthConnect Rwanda | Week 8 Task 4

**Data Analytics · Dashboard validation and visual clarity**

The main financial issue was resolved in the dashboard I tested: the facility and department charts stopped repeating the overall collections total. The checks below distinguish values visible in screenshots, my confirmations in Power BI, and figures verified from the sources or DAX definitions.

| Dashboard check | Result | Evidence |
| --- | --- | --- |
| Executive overview | **20,000** registered patients, **5,000** recorded appointments, **20** facilities, **350** doctors and **2.99 / 5** average satisfaction. | Source figures and my Week 8 confirmation of the saved report. Task 3 records the definitions and individual check details. |
| Collected Revenue card | **RWF 8,389,454,556** matches the sum of the payment amounts. | Exact value visible in the supplied card screenshot (P01). |
| Corrected facility and department charts | **HF006: RWF 40,224,830** and **DEP181: RWF 5,681,113**, both matching the source comparison. The charts no longer repeat the overall total across groups. | Corrected screenshot shows the new pattern. I confirmed the two sampled values separately (P02). |
| Facility filter and reset | Choosing a facility changes the collections charts. Clearing the selection restores the original view. | I tested and confirmed both actions (P02). |
| Patient selection reset | Clearing the Male/Female selection restores the original patient charts. | I confirmed the reset (P05). |
| Feedback month order | The chart displays January through December in order. | I confirmed the order (P04). |
| Bed status and Poor feedback | **0 of 2,000** beds marked Occupied; **5,283 of 21,064** feedback rows labelled Poor. | Source counts and reviewed DAX definitions (P03). These are source checks; no separate card screenshots are claimed. |

## How to Read the Visuals

- **Financial Dashboard:** The facility and department bars measure collected payments. The **(Blank)** group represents payments without a matching appointment: **RWF 7,694,903,236**, or **91.72%** of collections. Keep it visible. Its size makes the named bars look small, so use the full amounts when comparing groups. Keep the monthly **Reported Revenue** line separate.
- **Appointments and feedback:** Use **Recorded Appointments** to describe the booking count. The file does not capture attendance. Describe the feedback chart as **Poor Feedback by Linked Appointment Month** if the title needs clarification: it uses the appointment month because feedback submission dates are unavailable. Only 422 of the 5,283 Poor responses link to a recorded appointment.
- **Operations:** Describe the **0.0%** as bed occupancy in the available status snapshot. A trend or a capacity decision would require occupancy records over time.

**File version for submission:** The supplied `rwanda(1).pbix` still has the older facility and department chart fields. The post-correction screenshots and checks document the later Power BI state. Use the saved, corrected PBIX for the final package. The completed checks stand for that version; repeat them only if the relevant report elements change.

**Evidence:** AnalystLab Africa Week 8 guide, Data Analytics tasks 3–4 (p. 6); my Week 7 Testing Record (sections 10–12); Power BI checks P01–P05; exact collections and corrected financial dashboard screenshots; source verification results; and my Week 8 check of the saved report.
