# HealthConnect Rwanda: Week 7 Testing Record

Data Analytics track | Prepared 29 October 2026

Working document for Tasks 1 and 2 and subsequent execution results. The initial review, testing approach and user-reported KPI and patient-segment comparisons are recorded below. On 29 October 2026, the assistant independently verified the remaining source-data calculations and reproduced the uploaded SQL SELECT logic in a temporary SQLite database. These checks confirm source totals and join preservation; they do not establish execution in the user's MySQL installation or evaluation of the Power BI model. Live dashboard values, presentation changes and cross-track work remain separately identified. No repeat is required for unchanged checks that already passed.

**Current review status on 1 November 2026:** all five follow-up Power BI check groups are closed using the recorded source controls, exact card screenshot, supplied DAX definitions and user-confirmed application checks. Cross-track validation is not completed because no colleague from another track has been secured. The current execution register and section 12 supersede earlier pending-evidence notes in the dated history.

## 1. Week 6 review

Baseline update, 29 October 2026: the newly uploaded rwanda healthcare.sql and rwanda(1).pbix supersede the older SQL/PBIX previously used for the initial file review. Findings below distinguish historical issues from the code present in these latest uploads. File inspection does not establish live execution or interactive behaviour.

| Item | Review finding |
| --- | --- |
| SQL implementation | The newly uploaded rwanda healthcare.sql contains 40 numbered analyses and uses rwanda_healthcare with tables such as patients, appointments, facilities, payments and revenue. Use these current names instead of the earlier HEALTHCARE_ANALYTICS/hc_* templates. |
| Power BI report | The newly uploaded PBIX contains six named dashboard pages and 18 tables in its model diagram, including Calendar. The saved patient card uses the Total Patients measure; the Patient Analytics donut uses Gender with that same measure. Saved structure does not prove live visual interaction results. |
| Source data | Continue from the supplied Rwanda healthcare CSVs. Preserve the originals and keep Week 7 changes separately identifiable. |
| Business report | Provides the previous analytical findings, reference totals and documented limitations. |

### Issues identified in the file review

| ID | Finding | Interpretation and next action |
| --- | --- | --- |
| R01 | The earlier SQL question 32 had a repeated standalone ORDER BY. The latest uploaded question 32 has only the valid final ORDER BY and starts from Payments with left joins. | Historical syntax issue is absent in the latest code. Do not remove a nonexistent line. Execute the current query and reconcile its department groups, including Unknown, before marking runtime validation complete. |
| R02 | The earlier question 30 joined appointment rows to a repeated department key. The latest question 30 unions diagnoses, lab tests, prescriptions and admissions, then joins a DISTINCT DepartmentID/DepartmentName lookup. | The latest code already addresses the earlier join pattern. Test lookup uniqueness and clinical-event totals: 5,000 per record type and 20,000 overall, including Unknown. This is a clinical-event count, not an appointment-total query. |
| R03 | The latest uploaded revenue card uses the named Collected Revenue measure; the supplied DAX sums HC_Payments[AmountPaid]. The business report's executive collection definition is compatible with this current measure. | The earlier 1.13bn-versus-8bn comparison used different metrics and an older saved PBIX baseline. Current label/definition alignment is supported by file inspection and supplied DAX. Exact SQL-to-card collection agreement still requires full-value evidence under T02b. |
| R04 | The supplied Appointments CSV has AppointmentID, PatientID, DoctorID, FacilityID, DepartmentID, Date and VisitType, without an attendance/no-show field. | Do not derive missed visits from missing appointment references. Document the unsupported attendance metric. |
| R05 | The Week 7 guide names HealthConnect_Appointment_Data.csv, a data dictionary and a clinic knowledge base, whereas the Week 6 work used the Rwanda healthcare files. | Record the resource-continuity question for clarification. Continue independent checks of the existing work; do not silently substitute a dataset. |

## 2. Week 6 to Week 7 transition

Week 6 produced a MySQL analysis script, a six-page Power BI report and business findings covering patients, appointments, clinical activity, financial records, operations and patient experience. A major limitation was incomplete appointment-parent coverage, which restricts the attribution of many clinical and financial records to patient, facility, department or date details.

Week 7 will test the accuracy and consistency of important KPIs, SQL calculations, dashboard filters and business interpretations. The priorities are appointment-count preservation through joins, financial reconciliation, revenue definitions and the handling of unmatched records. Improvements will be based on observed test results and checked again after changes. The intended outcome is an analysis that communicates its verified results and limitations clearly before Week 8.

This record covers independent Data Analytics testing. The guide also requires a later shared validation activity with another track. Data Science is a proposed partner; no collaborative activity is claimed as completed here. Its scope depends on the colleague's actual dataset and modelling objective.

## 3. Testing approach

1. Preserve the Week 6 files and identify the Week 7 working copies.
2. Agree on the definition, source table, row grain and filter scope of each metric before comparing it.
3. Recalculate the relevant result from the source data or an independent SQL query.
4. Run the existing SQL or inspect Power BI using the same filters and definitions.
5. Record the expected and actual results, pass/fail outcome and evidence.
6. Investigate differences. Correct calculation or presentation errors and document source limitations with their impact.
7. Retest changed outputs using the original scenario, then update the affected findings and recommendations.

Use exact comparisons for identifier counts and whole-currency sums. Compare averages and percentages at the stated display precision. Do not compare differently filtered populations, distinct counts with row counts, or reported revenue with collected payments as if they were the same metric.

## 4. Reference values for the planned tests

These are reference values established during the Week 6 source checks and recorded in the current business report. They are not fresh Week 7 MySQL or Power BI execution results. Verify the source scope again when performing each test.

| Metric | Reference value | Definition or qualification |
| --- | ---: | --- |
| Registered patients | 20,000 | Unique PatientID in the patient register. |
| Recorded appointments | 5,000 | Unique AppointmentID in the supplied Appointments file; not verified attendance. |
| Facilities represented in appointments | 20 | Unique recorded FacilityID. Confirm the executive card's source and filter scope. |
| Registered doctors | 350 | Supplied Total Doctors DAX distinct-counts nonblank Medical Staff StaffID restricted to Role Doctor. The definition matches the registered-doctor population. |
| Average patient satisfaction | 2.99 / 5 | Average Rating across all 21,064 feedback records, rounded to two decimal places. |
| Reported revenue | 1,132,677,500 | Sum of Revenue in the 12-row Revenue Summary. |
| Collected payments | 8,389,454,556 | Sum of AmountPaid in Payments. |
| Total billed | 9,309,401,961 | Sum of Amount in Billing. |
| Outstanding balance | 919,947,405 | Billed amount less payments matched by BillingID; 11,887 bills have a remaining balance. |
| Billing appointment coverage | 5,000 matched; 55,000 unmatched | All 60,000 billing records must remain accounted for. |
| Payments attributable through appointments | 694,551,320 | Linked subset only; the remaining 7,694,903,236 lacks appointment-based attribution. |
| Feedback appointment coverage | 1,756 matched; 19,308 unmatched | Facility and department breakdowns through appointments describe the linked subset. |
| Beds | 2,000, all Available | Status-based occupancy is 0%; dated utilization cannot be established. |

Monetary figures use RWF as the documented assumption from the country master. The transaction files contain no explicit currency field. Transaction-level billing, payment and claim dates are absent. Reported monthly revenue has an unspecified accounting scope and must remain distinguishable from undated collections.

## 5. Planned tests

| Test ID | Component and purpose | Scenario | Expected result and evidence to retain |
| --- | --- | --- | --- |
| T01 | Executive KPI accuracy | Clear relevant filters and compare the patient, appointment, facility, doctor and satisfaction cards with independently calculated values. | Counts and averages match their agreed definitions and source scope. Retain SQL results, card bindings/measure definitions and a dashboard screenshot. |
| T02 | Revenue definition and documentation consistency | Compare the executive revenue-card source with the definition in the report and calculate both financial totals independently. | Reported revenue is 1,132,677,500; collected payments are 8,389,454,556. Labels, definitions and narrative consistently identify the selected metric. Retain both calculations and before/after wording. |
| T03 | Slicers and findings across segments | Apply one supported filter, then a second relevant segment; compare with SQL under the same conditions and finally clear the selections. | Applicable visuals match the filtered reference results; clearing selections restores the baseline. Unsupported filter paths are documented instead of being treated as valid segment attribution. Retain filter selections, queries and screenshots. |
| T04 | Clinical workload and join grain | Execute current SQL question 30; inspect the uniqueness of the derived department lookup and compare grouped clinical events with source counts. | Each record type totals 5,000 and all four types total 20,000, including Unknown. Every source clinical event contributes once; any duplicate lookup assignment is investigated. Retain lookup checks and grouped totals. |
| T05 | Department-revenue query execution | Execute current SQL question 32, whose earlier duplicate ORDER BY is already absent, and reconcile its groups including Unknown. | The current query runs and grouped collections sum to 8,389,454,556 overall, including unattributed payments. Retain the current statement and result; do not claim the assistant made an already-present correction. |
| T06 | Preservation of unmatched appointment references | Reconcile billing record counts and payments before and after appointment attribution. | Billing remains 60,000 records: 5,000 matched and 55,000 unmatched. Collections remain 8,389,454,556 overall; 694,551,320 is attributable through appointments and 7,694,903,236 remains unattributed. Retain the reconciliation and explain the scope of any linked-only visual. |
| T07 | Financial balance and status interpretation | Aggregate payments by BillingID, calculate bill balances and compare the source status with an explicitly defined money-based classification. | Overall balance is 919,947,405 across 11,887 balance-positive bills. Preserve source status separately and investigate classification differences without assuming a status-effective date. Retain the reconciliation, classification rule and results. |
| T08 | Capacity and utilization interpretation | Check bed-status counts and the available equipment fields, then inspect dashboard labels and accompanying explanations. | The 0% bed figure is identified as status-based occupancy of the supplied inventory. Equipment usage and utilization over time remain unavailable without appropriate activity data. Retain status counts, schema evidence and the relevant labels. |
| T09 | Feedback population and ranking interpretation | Recalculate the overall average and the appointment-linked sample; inspect facility/department rankings and any trend proxy. | The overall 2.99/5 average covers 21,064 responses; appointment-based rankings cover 1,756 linked responses and show response counts. Any Poor-feedback trend is labelled as an appointment-month proxy, covering 422 linked Poor records. Retain calculations, denominators and visual labels. |
| T10 | Facility and department consistency | Compare recorded FacilityID with the department-master association and inspect how comparisons are described. | Record the previously observed 1,187 staff and 4,744 appointment conflicts if reproduced. Preserve recorded IDs; document uncertainty and avoid an unverified reassignment. Retain the comparison query and limitation wording. |
| T11 | Attendance/no-show scope | Inspect the available appointment fields and review any attendance-related conclusions against the named resources. | No attendance/no-show rate is claimed from the current seven-column appointment file. Missing parent IDs remain a linkage limitation. Record the Week 7 resource question and evidence of the schema limitation. |

### Execution register

T01 count comparisons and T03 patient comparisons passed by user report. The assistant's local source verification now confirms the satisfaction average, collected-payment total, clinical-event preservation, financial reconciliation and documented data limitations. The following register distinguishes local source verification from user-reported live results and outstanding application checks. Retest means repeating an affected scenario after a correction. It is not required for unchanged checks that passed.

| Test ID | Actual result | Pass/fail | Issue identified during execution | Action taken | Retest result | Evidence | Collaborating track |
| --- | --- | --- | --- | --- | --- | --- | --- |
| T01 | Reported counts retained; source controls and provided registered-doctor and feedback-average DAX agree with intended definitions | Pass within agreed source/definition review | Earlier named-measure uncertainty resolved; historical native MySQL error is separately recorded | Reviewed supplied definitions and existing count controls | No correction required for the provided formulas | Source outputs, user counts and pasted DAX | Independent Data Analytics |
| T01a | SQL patient count: 20,000; Power BI Total Patients card: 20K / 20,000 | Pass - user-reported | No count difference reported | No correction required | Not required: no change made | User's chat confirmation on 29 October 2026; SQL result and card screenshots pending | Independent Data Analytics |
| T01b | SQL appointment count: 5,000; Power BI Total Appointments card: 5K / 5,000 | Pass - user-reported | No count difference reported | No correction required | Not required: no change made | User's chat confirmation on 29 October 2026; SQL result and card screenshots pending | Independent Data Analytics |
| T01c | Facility total: 20, reported in response to the SQL and Power BI comparison | Pass - user-reported | No count difference reported | No correction required | Not required: no change made | User's chat confirmation on 29 October 2026; SQL result and card screenshots pending | Independent Data Analytics |
| T01d | Doctors represented in appointments: 350, reported in response to the SQL and Power BI comparison | Pass - user-reported | No count difference reported | No correction required | Not required: no change made | User's chat confirmation on 29 October 2026; SQL result and card screenshots pending | Independent Data Analytics |
| T01e | Source average 2.99 over 21,064 responses; provided DAX is AVERAGE of feedback Rating | Pass - source and definition review | Historical Error 1146 was not rerun in native MySQL; this result uses independent source verification and the provided Power BI definition | Reviewed the source average and supplied formula | No formula correction required; no claim that the native MySQL error was fixed | Source calculation, pasted DAX and prior reported 2.99 value | Independent Data Analytics |
| T01f | Total Doctors distinct-counts nonblank Medical Staff StaffID with Role = Doctor; Average Patient Satisfaction averages feedback Rating | Pass - formula definition review | No definition discrepancy found in the supplied formulas | Matched registered-doctor definition and feedback-average source, expected 350 and 2.99 unfiltered | Not required: no formula change made | User-pasted formulas on 1 November 2026; native Power BI execution not performed by assistant | Independent Data Analytics |
| T02 | Source totals reproduced; exact Collected Revenue card screenshot shows 8,389,454,556 and user confirms HF006 and DEP181 control values match | Card exact-value pass observed; two group controls pass by user report | Original repeated-total grouping pattern is resolved in the supplied evidence and sampled confirmations | Compared exact card screenshot and retained source/group reference values | Exact total confirmed; sampled group values confirmed by user; financial slicer interaction and clearing confirmed by the user under T03e | Screenshot image(20261101-163248).png, earlier financial screenshot, source outputs and user confirmation | Independent Data Analytics |
| T02a | SQL uses reported revenue; provided Power BI DAX uses collected payments | Source mismatch explained; numerical comparison superseded | The original SQL/card comparison used different metrics | Use separate reported-revenue and collection definitions; perform collection comparison under T02b | Original unlike-metric comparison is not a pass/fail calculation test | User clarification and supplied DAX | Independent Data Analytics |
| T02b | New Power BI screenshot displays 8389454556, equal to source SUM(AmountPaid) 8,389,454,556 | Pass - exact card value observed | Earlier rounded 8bn evidence superseded by the full-value screenshot | Compared the displayed full number with the independently checked source control | Exact-value comparison passed; no DAX correction required on this evidence | Supplied screenshot image(20261101-163248).png on 1 November 2026 and source verification | Independent Data Analytics |
| T02c | Post-change screenshot shows Blank near 7.7bn and small varying known-group bars; facility order starts HF006, HF011, HF013 as in source Q31 | Initial fail; qualitative post-change check passed | Original same-total-for-every-group pattern appears resolved; missing appointment attribution remains a source limitation | Reviewed supplied image; no assistant PBIX edit or live interaction performed | Appearance consistent with source controls; exact numerical agreement not established from rounded axes | Supplied Financial Dashboard screenshot image(20261029-195358).png and local source group controls | Independent Data Analytics |
| T02d | User says the others match after being asked for HF006 40,224,830 and DEP181 5,681,113 | Pass - user-reported sampled group comparison | No sampled amount difference reported | Recorded confirmation against the two explicitly supplied reference values | Two group controls passed by user report; no new group tooltip screenshots supplied | Latest user statement on 1 November 2026; exact card screenshot supports T02b, not the group values | Independent Data Analytics |
| T03 | Male/Female comparisons, patient clearing, financial slicer response and financial clearing all confirmed by the user | Pass for selected interaction scenarios | No remaining failure reported in the agreed tests | Recorded explicit clearing/reset confirmation for the patient chart, in addition to finance | Not required: no further change | User confirmations and saved/source controls | Independent Data Analytics |
| T03a | Male 10,090; Female 9,910, reported as matching without a manual gender filter | Breakdown agreement - user-reported; setup confirmed | No manual filter is required to show both grouped categories | Recorded SQL grouping and donut Category=Gender; interaction subsequently passed under T03b | Not required: no change made | User report and saved definitions | Independent Data Analytics |
| T03b | User confirmed the existing Gender donut changes/highlights the ChronicCondition chart | Pass - user-reported basic interaction | No interaction failure reported | No new slicer or visual needed; Male/Female numerical comparisons separately passed | Not required: no change made | User confirmations; no interactive action performed by assistant | Independent Data Analytics |
| T03c | User states the selected Male ChronicCondition values match the SQL results | Pass - user-reported | No selected-value difference reported | No correction required | Not required: no change made | User confirmation received; individual SQL counts and selected-value screenshots not supplied | Independent Data Analytics |
| T03d | Female selected values matched SQL by user report; later patient reset is confirmed under T03f | Pass - user-reported comparison | No discrepancy reported | Retained earlier pass and linked later clearing confirmation | No further repeat required | User confirmations; separate selected-value screenshots not supplied | Independent Data Analytics |
| T03e | User confirms the financial facility slicer changes collected-revenue charts and clearing it restores them | Pass - user-reported interaction and reset | No failure reported | Recorded the direct yes response to the stated two-part financial interaction test | Not required: no further change made | User confirmation on 1 November 2026 | Independent Data Analytics |
| T03f | User answers yes that clearing the Male/Female selection restores the original patient charts | Pass - user-reported patient reset | No reset failure reported | Recorded response to the explicit patient-reset question | No additional correction required | User confirmation on 1 November 2026 | Independent Data Analytics |
| T04 | Uploaded Q30 reproduced locally: 5,000 Admission, 5,000 Diagnosis, 5,000 Lab test and 5,000 Prescription events; 20,000 overall | Pass for source-data logic | No ambiguous DepartmentID/DepartmentName mapping in the source lookup | Reproduced current SELECT with source department lookup and retained Unknown events | Current already-corrected logic verified locally; imported facilities table not inspected live | Assistant local query output and source hashes | Independent Data Analytics |
| T05 | Uploaded Q32 reproduced locally; all department groups sum to 8,389,454,556, including Unknown 7,694,903,236 | Pass for source-data logic | Old duplicate ORDER BY absent from current SQL | Executed current SELECT locally without modifying uploaded SQL | Current already-corrected logic verified locally; no MySQL execution claimed | Assistant local query output | Independent Data Analytics |
| T06 | Billing 60,000: 5,000 appointment matches and 55,000 unmatched; collections 694,551,320 linked plus 7,694,903,236 unattributed equal 8,389,454,556 | Pass for source reconciliation | Incomplete appointment-parent coverage limits attribution | Reconciled original CSVs and current LEFT JOIN query outputs | Not required: no source or code change | Assistant source-verification results | Independent Data Analytics |
| T07 | Bill balances total 919,947,405; 11,887 bills have positive balances; 39,961 source statuses differ from the stated money-based rule | Reconciliation passed; status limitation documented | No status-effective or payment dates establish the timing of status differences | Aggregated payments by BillingID and reproduced Q35 locally; preserved source Status | Not required: no change made | Assistant source-verification results; classification rule documented below | Independent Data Analytics |
| T08 | Total Beds distinct-counts nonblank BedID; occupied-over-total formula fits the source snapshot of 2,000 Available beds and 0 Occupied | Pass - source and full definition review | Historical base-measure dependency is now resolved; time-based utilisation remains unsupported by source data | Reviewed both provided formulas and confirmed source distinct bed count | No formula correction required | User-pasted Total Beds and utilisation DAX, source base-count check and prior 0% display report | Independent Data Analytics |
| T09 | Total Feedback counts response rows; Poor Feedback applies Comment Poor with KEEPFILTERS. User confirms January-to-December order and earlier rename | Pass - full definition review and user-reported presentation | Historical base-definition and month-order gaps are resolved; appointment-month proxy remains a source limitation | Reviewed supplied COUNTROWS base and Poor filter; recorded the chronological-order response | No further formula or sort correction requested within agreed checks | Six supplied DAX definitions, source controls and user confirmations | Independent Data Analytics |
| T09a | User answers yes that feedback trend months run January through December in chronological order | Pass - user-reported month order | No remaining order issue reported | Recorded response to explicit chronological-order question | No additional change required | User confirmation on 1 November 2026 | Independent Data Analytics |
| T10 | Reproduced 1,187 staff and 4,744 appointment facility/department assignment conflicts | Source limitation reproduced | Source assignments differ from department-master facility associations | Preserved original IDs and documented attribution uncertainty | Not required: no reassignment made | Assistant source-verification results | Independent Data Analytics |
| T11 | Appointment file has seven columns and no attendance/no-show status | Scope limitation verified; resource clarification outstanding | Missing appointment-parent IDs do not measure missed visits | Recorded unsupported metric; no fabricated no-show rate | Not required: no change made | Original CSV header; Week 7 resource question remains | Independent Data Analytics |

When a test succeeds without a change, record the successful validation and mark action/retest as not required with a reason. Do not invent a problem to populate the record. When a source limitation remains, document its effect and mitigation instead of describing it as repaired data.

### Patient-count check: T01a

- Objective: confirm agreement between the SQL patient count and the existing Total Patients card.
- Planned scenario: unfiltered patient-register total; the user was instructed to clear Power BI slicers and page/report filters.
- Expected result: 20,000 patients.
- Actual result: the user confirmed that SQL and Power BI both show 20K / 20,000.
- Outcome: Pass, based on user-reported results. The SQL result grid and dashboard filter state have not been independently inspected.
- Action: no correction needed for the reported count match.
- Retest: not required because no change was made.
- Evidence received: chat confirmation. Screenshots remain to be retained as submission evidence.
- Collaboration: independent Data Analytics work.

Query provided for the check:

```sql
SELECT
    COUNT(*) AS Total_Rows,
    COUNT(DISTINCT PatientID) AS Unique_Patients
FROM HEALTHCARE_ANALYTICS.hc_patients;
```

### Appointment-count check: T01b

- Objective: confirm agreement between the SQL appointment count and the existing Total Appointments card.
- Planned scenario: unfiltered supplied appointment file; the user was instructed to clear Power BI filters.
- Expected result: 5,000 appointments.
- Actual result: the user confirmed 5,000 / 5K in response to the SQL and dashboard comparison.
- Outcome: Pass, based on user-reported results. The SQL result grid and dashboard filter state have not been independently inspected.
- Action: no correction needed for the reported count match.
- Retest: not required because no change was made.
- Evidence received: chat confirmation. Screenshots remain to be retained as submission evidence.
- Collaboration: independent Data Analytics work.

Query provided for the check:

```sql
SELECT
    COUNT(*) AS Total_Rows,
    COUNT(DISTINCT AppointmentID) AS Unique_Appointments
FROM HEALTHCARE_ANALYTICS.hc_appointments;
```

### Facility-count check: T01c

- Objective: compare the distinct facility total in the SQL Hospital Facilities table with the existing Power BI Total Facilities card, which uses the corresponding facility field.
- Planned scenario: clear relevant Power BI filters and count each distinct FacilityID once, preserving the bed-level grain of the source table.
- Expected result: 20 facilities.
- Actual result: the user reported 20 in response to the SQL and dashboard comparison.
- Outcome: Pass, based on the user-reported result. Separate SQL and card screenshots have not been supplied for independent inspection.
- Action: no correction required for the reported count match.
- Retest: not required because no change was made.
- Evidence received: chat confirmation. Retain the SQL result and card screenshots for submission evidence.
- Collaboration: independent Data Analytics work.

Query provided for the check:

```sql
SELECT
    COUNT(DISTINCT FacilityID) AS Total_Facilities
FROM HEALTHCARE_ANALYTICS.hc_hospital_facilities;
```

### Doctor-count check: T01d

- Objective: compare distinct DoctorID in Appointments with the existing Total Doctors card, which uses DoctorID from Appointments.
- Planned scenario: clear relevant Power BI filters and count each distinct DoctorID once.
- Expected result: 350 doctors represented in the supplied appointment records.
- Actual result: the user reported 350 in response to the SQL and dashboard comparison.
- Outcome: Pass, based on the user-reported result. Separate SQL and card screenshots have not been supplied for independent inspection.
- Definition: this comparison checks doctors represented in appointments. It does not independently validate the separate Doctor register or prove that all registered doctors have appointments.
- Action: no correction required for the reported count match.
- Retest: not required because no change was made.
- Evidence received: chat confirmation; SQL and card screenshots remain to be retained.
- Collaboration: independent Data Analytics work.

Query provided for the check:

```sql
SELECT
    COUNT(DISTINCT DoctorID) AS Total_Doctors
FROM HEALTHCARE_ANALYTICS.hc_appointments;
```

### Average-satisfaction check: T01e

- Objective: compare the average Rating in the actual SQL feedback table with the existing Average Patient Satisfaction card.
- Planned scenario: clear relevant Power BI filters and compare results at two decimal places.
- Expected result from the source reference: 2.99 out of 5.
- Initial user report: 2.99.
- Subsequent supplied evidence: MySQL Error 1146, reporting that rwanda_healthcare.patient_feedback does not exist. The user's executed query used FROM patient_feedback, whereas the provided query named HEALTHCARE_ANALYTICS.hc_patient_feedback.
- Current outcome: the supplied SQL attempt failed to execute. SQL-to-card agreement remains pending a successful rerun; the error is not evidence that the average itself is incorrect.
- Action: locate the existing feedback table through information_schema.tables and use the returned database and table names in the query.
- Retest: pending. Do not rename or create a table merely to match a guessed name.
- Evidence received: chat value and pasted MySQL error. Successful SQL output and card screenshots are still required for the evidence record.
- Collaboration: independent Data Analytics work.

User-supplied failing query:

```sql
SELECT ROUND(AVG(Rating), 2) AS Average_Satisfaction
FROM patient_feedback;
```

Read-only discovery query provided next:

```sql
SELECT TABLE_SCHEMA, TABLE_NAME
FROM information_schema.tables
WHERE TABLE_NAME LIKE '%feedback%';
```

The result will determine the exact qualified FROM clause. The actual local database must be used; the Week 6 script's HEALTHCARE_ANALYTICS name does not establish which schema is selected in the user's current MySQL session.

### Revenue source comparison: T02a

- Initial comparison: SQL showed about 1.13 billion and Power BI showed about 8 billion.
- Supplied DAX: Collected Revenue = SUM('HC_Payments'[AmountPaid]).
- Finding: the current Power BI measure sums collected payments. The earlier SQL summed reported Revenue from Revenue Summary. These are different source metrics.
- Reference totals: reported revenue 1,132,677,500; collected payments 8,389,454,556.
- Outcome: source mismatch explained. The initial unlike-metric comparison is not evidence that either aggregation is incorrect.
- Saved versus local state: the previously inspected PBIX package used Revenue Summary for its executive revenue binding. The user-supplied current DAX confirms that the local Collected Revenue measure uses Payments.
- Action: perform the matching collection test T02b and align labels/documentation with the chosen metric.
- Evidence: user-reported rounded values and supplied DAX. Source scope of reported monthly revenue versus undated payments remains a separate limitation.
- Collaboration: independent Data Analytics work.

### Collected-revenue comparison: T02b

- Objective: compare SUM(AmountPaid) in SQL with the current Power BI Collected Revenue measure.
- Expected result from source reference: 8,389,454,556, with filters cleared.
- Actual result: the user reported about 8 billion for the card. The matching SQL result and exact card value have not yet been supplied.
- Outcome: Pending.
- DAX provided by the user:

```dax
Collected Revenue =
SUM('HC_Payments'[AmountPaid])
```

Matching SQL provided next, using the Payments table name previously seen in the user's rwanda_healthcare SQL analysis:

```sql
SELECT
    SUM(AmountPaid) AS Collected_Revenue
FROM rwanda_healthcare.payments;
```

- Action: execute the matching SQL and compare the full card value under the same filter scope. Resolve the actual table name if it has changed in the live database.
- Retest: pending initial comparison. Do not modify the DAX merely to reproduce the separate Revenue Summary total.
- Documentation: keep Collected Revenue and Reported Revenue distinguishable; final wording consistency is not yet marked completed.
- Evidence pending: exact SQL output, full card value, filter state and screenshots.
- Collaboration: independent Data Analytics work.

### Feedback table discovery follow-up

The supplied screenshot showed two feedback tables in rwanda_healthcare: patient feedback (with a space) and patient_feedback (with an underscore). The user requested a DROP TABLE statement for the first table; the statement was supplied, but successful execution was not confirmed. No DROP operation was performed by the assistant. The next satisfaction check should use the observed underscore table name, rwanda_healthcare.patient_feedback, and record its successful output before restoring T01e to Pass.

### Gender breakdown and interaction: T03a-T03b

Latest file evidence:

- SQL question 2 groups patients by Gender using COUNT(*).
- The Patient Analytics page has a donut with HC_Patients[Gender] as Category and the Total Patients measure as Value.
- A separate clustered bar chart uses ChronicCondition with Total Patients.
- The Executive Dashboard patient card has no explicit Gender filter saved in its visual filter configuration. No explicit page-level Gender filter is present on the two inspected pages.
- The user reported the same gender counts without using a manual Gender filter. This is consistent with a chart showing separate category totals, but it does not establish a live click-and-reset test.
- Reference gender counts remain Male 10,090, Female 9,910, overall 20,000.

T03a outcome: user-reported gender-breakdown agreement, supported by inspection of the grouping setup. No extra manual Gender filter is necessary to produce the two chart categories.

T03b proposed live test:

1. On Patient Analytics, select Male in the existing Gender donut.
2. Observe the ChronicCondition chart on that same page. Depending on interaction settings, related values may be filtered or highlighted while unrelated values remain dimmed.
3. Select Female and observe its corresponding response.
4. Select the same slice again or empty space within the donut to clear the selection; check that the original display returns.

T03b outcome: the user confirmed that the interaction works after being instructed to click the Male slice in the existing Gender donut, observe the ChronicCondition chart and clear the selection. Record this as a user-reported pass for basic chart interaction. The exact interaction mode, Female/reset outcomes and selected-group numeric counts were not individually supplied. File metadata alone was not used as proof of the live response. This does not establish that a selection on Patient Analytics changes a card on another page.

### Selected-group numeric comparison: T03c

- Objective: validate the numbers produced by the working chart interaction, beyond confirming that the visual responds.
- Source: the current SQL upload uses rwanda_healthcare.patients, with Gender and ChronicCondition fields.
- Scenario: calculate Male patient counts by ChronicCondition in SQL, then select Male in the existing Gender donut on Patient Analytics.
- Expected result: each SQL category count matches the corresponding filtered/highlighted Male value in the ChronicCondition chart. SQL category counts total 10,090 Male patients for the supplied source reference.
- Actual result: the user confirmed that the selected Male chart values match the SQL counts. Individual category counts and screenshots were not supplied.
- Pass/fail: Pass, based on user-reported agreement.
- Action taken: the user performed the requested comparison and reported agreement. No correction was required. The test concerns the selected/highlighted Male values, not the full background bars.
- Evidence received: chat confirmation. Retain the SQL output, Male selection and corresponding values/screenshots for submission.
- Retest: not required because no change was made.
- Collaboration: independent Data Analytics.

```sql
SELECT
    ChronicCondition,
    COUNT(*) AS Male_Patients
FROM rwanda_healthcare.patients
WHERE Gender = 'Male'
GROUP BY ChronicCondition;
```

### Female-group comparison and selection reset: T03d

- Objective: check a second patient segment and confirm that clearing the selection restores the original display.
- Scenario: repeat the chronic-condition SQL query for Female, select Female in the existing Gender donut, compare equivalent chart values and then clear the selection.
- Expected result: the chart's selected Female values match SQL. The source-reference Female total is 9,910. Clearing the selection restores the original unfiltered chart display.
- Actual result: the user confirmed that the Female values match SQL. The clearing/reset outcome was not described separately.
- Pass/fail: Pass for the Female numeric comparison, based on user report. Explicit reset evidence remains pending.
- Action taken: Female numeric comparison completed by the user with no discrepancy reported. No correction or new slicer was required.
- Retest: not required for the unchanged Female comparison. Record the reset alongside the chart evidence.
- Evidence received: user chat confirmation. The SQL results and selected/reset chart screenshots remain to be retained for submission.
- Collaboration: independent Data Analytics.

```sql
SELECT
    ChronicCondition,
    COUNT(*) AS Female_Patients
FROM rwanda_healthcare.patients
WHERE Gender = 'Female'
GROUP BY ChronicCondition;
```

### Latest-upload review notes

- Six pages and 18 diagram tables are present, including Calendar; do not recreate a Date table solely because an older review had 17 tables.
- The current Total Doctors card uses a named measure hosted in Medical Staff. The home table alone does not disclose its DAX expression. The earlier appointment-based 350 count is retained as a represented-doctor check; confirm the named measure's definition before claiming it validates the full staff register.
- The current Collected Revenue card has display-unit scaling disabled in its saved visual settings. This confirms formatting configuration, not its evaluated numeric total.
- The latest SQL question 32 already removes the old standalone ORDER BY issue.
- The latest question 30 counts clinical events across four files and uses a distinct department lookup. Its correct reference is 20,000 total clinical events, not 5,000 appointments.
- SQL question 31 and question 32 start from Payments with left joins, preserving unmatched attribution as Unknown. Runtime reconciliation remains required.

### Assistant source verification and retest decision: 29 October 2026

The user asked the assistant to perform the remaining checks from the available files and document the results. Unchanged checks that already passed will not be repeated. A skipped or inaccessible application check is recorded as unverified, rather than being assumed to pass.

**Method and scope.** The original CSVs were read into a temporary, in-memory SQLite database using Python's standard library. The 39 implemented SELECT statements in the latest uploaded SQL were executed locally without local execution errors. Question 33 contains a documented unavailable service-revenue analysis rather than an executable query. MySQL MONTH and MONTHNAME functions were reproduced for the local run. The three known BOM-mojibake headers were modelled as they appear in the uploaded script. The local facilities lookup came from the source Departments file, and Location was rebuilt from the source village/sector/district/province hierarchy. These checks verify calculation and join logic against the original data. They do not certify MySQL dialect behaviour, the user's imported tables, database settings, merged-table contents, Power BI relationships or DAX evaluation.

No SQL, PBIX or original CSV was modified. SHA-256 hashes of all inputs used were unchanged before and after the run. The SQL input hash is db388ae26a324055f713c21c9a4b3b57e4a32cdcb4c6f6e63278c9d8c08c44f1. The PBIX input hash is 95dd69114b40957e0fcfa01e947e2545e40646f3dfdf952ce759948b685f8b49.

| Check | Locally observed result | Conclusion |
| --- | --- | --- |
| Current Q30 clinical workload | Admission 5,000; Diagnosis 5,000; Lab test 5,000; Prescription 5,000; total 20,000 | Current query preserves all source clinical events, including Unknown attribution. The source department lookup has one name per DepartmentID. |
| Current Q31 facility collections | Sum of groups 8,389,454,556 | All payments retained by source-data LEFT JOIN logic. |
| Current Q32 department collections | Sum of groups 8,389,454,556; Unknown 7,694,903,236 | Existing corrected query preserves the full collection total. |
| Billing appointment coverage | 60,000 bills = 5,000 matched + 55,000 unmatched | Unknown appointment attribution is retained and quantified. |
| Payment-to-bill linkage | All 60,000 payment rows link to bills; no repeated payment BillingID in the supplied data | Current Q40's direct payment join does not repeat bills for this source snapshot. Future multiple payments per bill would require aggregation before summing billed amounts. |
| Financial reconciliation | Billed 9,309,401,961 minus collected 8,389,454,556 = 919,947,405 | Outstanding balance, not demonstrated loss or profit. No expense dataset establishes profit. |
| Current Q35 positive balances | 11,887 rows, total 919,947,405 | Positive bill balances reconcile to the overall source balance. |
| Linked-only facility ranking | Current Q40 collection groups total 694,551,320 | Describes the appointment-linked subset. This is not the full collection total. |
| Reported monthly revenue | 1,132,677,500 | Distinct scope from collected payments. |
| Insurance claims | 4,881,863,293.88 | Claims are not additional proven collected cash. |
| Source Status comparison | 39,961 bills differ from Paid if payment >= billed, Partially Paid if 0 < payment < billed, otherwise Pending | This diagnostic rule is explicit. Missing effective dates prevent asserting that every differing source status is erroneous. |
| Feedback | 21,064 responses; average 2.99/5 | Source average verified. Earlier local MySQL table error is not resolved by this check. |
| Appointment-linked feedback | 1,756 responses; average 2.93/5; 19,308 unmatched responses | Appointment-based facility/department comparisons describe the linked sample and require that scope in interpretation. |
| Poor-feedback proxy | 5,283 Poor comments; 422 linked to appointment months; 4,861 without an appointment month | A dated complaints trend is unsupported. |
| Beds and equipment | 2,000 beds, all Available; 200 equipment rows with identity/name/department/facility fields only | Bed figure is a recorded status snapshot. Equipment/time-based utilization is unavailable. |
| Staff source | Doctor 350; Nurse 700; Radiographer 30; Laboratory Scientist 40; Pharmacist 50; Administrative Staff 80; total 1,250 | Import one Doctor copy. The two Doctor source files are byte-identical. This does not evaluate the current Total Doctors DAX. |
| Facility/department consistency | Staff 1,187 conflicts; appointments 4,744 conflicts | Reproduced source limitation. No guessed reassignment was made. |
| Appointment attendance scope | AppointmentID, PatientID, DoctorID, FacilityID, DepartmentID, Date, VisitType | No attendance/no-show field is present. |

**Saved Power BI presentation observations.** The financial visuals distinguish a Reported Revenue measure for the monthly line from Collected Revenue for payment methods and facility/department groups. Their actual filtered values and relationships cannot be established from visual bindings. The operational card uses Recorded Bed Utilization %, whose DAX is not decoded. The patient-experience chart titled Complain Trends binds Appointment Month to Poor Feedback and sorts by Poor Feedback descending. Recommended refinement: describe it as poor feedback by appointment month, state the linked-sample limitation and sort chronologically. No PBIX change or post-change visual test is claimed.

**Additional SQL wording observation.** Question 4 says above 65 but uses Age >= 65. This returns 5,701 source patients, whereas Age > 65 returns 5,487. Keep the existing calculation and describe it as age 65 and above, or deliberately adopt > 65 if that is the intended definition. This is a boundary/wording decision, not a newly applied code fix.

**Retest decision.** The current Q30 and Q32 already contain the earlier corrections. Their current source-data logic has now been verified locally, and no additional user rerun is needed for that local evidence. No correction was required for the passed patient counts or gender comparisons, so their retest entries remain not required. The source average, financial totals, linkage coverage and scope checks above now have actual assistant-run evidence. Live MySQL error resolution, exact evaluated Power BI values, unknown DAX definitions and proposed visual refinements remain unverified. They are not labelled successful retests.

### Financial visual grouping issue: T02c

On 29 October 2026, the user reported that every facility and every department shows the same Collected Revenue value. The exact repeated value was not supplied in that message. This is a user-reported failure of the group breakdown, even though the independently checked source total is correct. It does not establish that the unfiltered total card is wrong.

Saved visual evidence in the current rwanda(1).pbix:
- Revenue by Facility categorizes Hospital Facilities[FacilityID].
- Revenue by Department categorizes Hospital Facilities[DepartmentID].
- Both use the named Collected Revenue measure. The user-supplied DAX definition is SUM('HC_Payments'[AmountPaid]).

The leading explanation is absent or ineffective filter propagation from the category table to Payments. The exact relationship state cannot be read from the diagram layout alone, so no specific missing relationship is asserted as confirmed. Microsoft documents missing relationships and non-propagating filters as causes of identical values for every grouping: https://learn.microsoft.com/en-us/power-bi/guidance/relationships-troubleshoot (accessed 29 October 2026).

Focused repair proposed for the user's Power BI session:
1. For these appointment-attributed collections, use HC_Clinical_Appointments[FacilityID] and HC_Clinical_Appointments[DepartmentID] on the corresponding chart axes, retaining Collected Revenue as the value.
2. If grouping still fails, inspect the existing relationships: Appointments[AppointmentID] to Billing[AppointmentID], then Billing[BillingID] to Payments[BillingID]. Check active status, compatible matching keys and filter propagation toward Payments. Do not create duplicate relationships or enable bidirectional filtering indiscriminately.
3. Check one affected group after the change. With unrelated filters cleared, the source controls include HF006 = 40,224,830; HF005 = 30,982,150; DEP181 = 5,681,113; DEP151 = 1,332,998. These unequal source totals establish that equal chart values are not explained by equal source collections.
4. Preserve unmatched attribution. Linked groups total 694,551,320. Another 7,694,903,236 is unattributed, for 8,389,454,556 overall. A blank/Unknown group is expected where appointment parents are absent and must not be distributed to known facilities or departments.

No PBIX repair, relationship edit or post-correction application test has been performed by the assistant. No successful fix is claimed. This focused issue does not reopen the passed patient counts, gender comparisons or independent SQL/source reconciliations.

### Financial grouping screenshot follow-up: T02c

The user supplied [Financial Dashboard screenshot](https://chatgpt.com/library?file_id=libfile_b3c40279525081919c99eedb643c0c19&account_id=personal), image(20261029-195358).png, following the proposed chart-axis correction. The assistant inspected the attached image directly.

Observed:
- Revenue by Facility and Revenue by Department now show one dominant (Blank) group near 7.7 billion and much smaller known-group bars. They no longer visibly repeat the entire collection total for every known category.
- The known facility order starts HF006, HF011 and HF013, consistent with the independently reproduced source grouping.
- The displayed blank group and small bars are consistent with 7,694,903,236 unattributed collections and 694,551,320 in known appointment-linked groups. These exact values come from the source calculations, not from reading rounded values off the image.
- The facility slicer is visible and appears unselected. No click or slicer-response test was performed by the assistant.
- The screenshot has no exact group tooltip or full-value card, so it does not establish exact numeric equality for every group or the evaluated grand total.

Outcome: the qualitative check of the reported repeated-total issue passed on the supplied screenshot. The pattern appears corrected. The large blank group is expected from missing appointment parents and should remain accounted for as unknown/unattributed. Its size compresses the known bars on the shared axis; it does not mean those known values are zero. No further full SQL or patient/gender repeat is required.

## 6. Evidence and version handling

- Keep representative evidence identifying the query, result, filter scope and metric definition. The assistant-run local calculations above are recorded outputs; a separate screenshot for every unchanged calculation is unnecessary.
- Identify the Power BI page and filter selections in dashboard screenshots.
- Preserve before/after evidence when a calculation, join, label or narrative changes.
- Keep a dated Week 7 working version of SQL, PBIX and documentation. Preserve the original CSVs.
- Update this record as testing occurs; incorporate its review, results, limitations and Week 8 actions into the final Week 7 report.
- Keep the final short Week 7 Project Summary complementary to the report rather than duplicating it.

## 7. Sources and current status

- AnalystLab Africa Week 7 Data Analytics Assignment, sections 3, 6, 7, 8B, 12-15.
- [Latest supplied SQL: rwanda healthcare.sql](https://chatgpt.com/library?file_id=libfile_fe6d42df4ba4819182e926f25edd4c4d&account_id=personal), inspected directly from the supplied attachment on 29 October 2026.
- [Earlier SQL reference](https://chatgpt.com/library?file_id=libfile_7a35084fadf48191b333aed30cd2289c&account_id=personal), retained as historical review context.
- [Latest supplied Power BI: rwanda(1).pbix](https://chatgpt.com/library?file_id=libfile_8e3a9ff0d48c8191a72d450b3e17219a&account_id=personal), inspected directly from the supplied attachment on 29 October 2026.
- [Earlier Power BI reference](https://chatgpt.com/library?file_id=libfile_f09b2ff5c7f8819190d51263f278689b&account_id=personal), superseded by the latest supplied PBIX.
- [Current Week 6 business insights report](https://chatgpt.com/library?file_id=libfile_a9960d817af48191a43c07c96a7009d2&account_id=personal).
- Supplied source CSVs and the previously completed source-data aggregate checks.

Status: the agreed independent review and all five follow-up Power BI check groups are complete within the stated evidence scope. Exact Collected Revenue is observed in the supplied screenshot; HF006 and DEP181 match by user report. All six supplied measure definitions and their base dependencies were reviewed. The user confirms financial slicer response and clearing, patient-selection clearing and chronological feedback months. Source limitations remain documented. Actual cross-track validation is not completed as of 1 November 2026 because no colleague has been secured. The corrected PBIX and external uploads/submission remain user actions. No native MySQL or Power BI execution by the assistant is claimed.

The earlier 2-4 hour estimate preceded this assistant-run batch and is superseded. Do not repeat passed unchanged checks. Finish remaining application-specific refinements only where necessary, assemble the verified record and its limitations, then complete actual cross-track work and final submission.

## 8. Final documentation and assignment coverage audit

Prepared on 29 October 2026 following the user's request for final documentation. The main report is nine pages and the separate project summary is one page. Both were rendered and visually reviewed before delivery. The documentation package includes the README, detailed testing record, unchanged supplied SQL, aggregate source verification results, query execution log, official activity coverage, recovered original work plan and the supplied financial screenshot. No native Power BI or MySQL execution is newly claimed by producing these documents.

The recovered original practical work plan had 12 steps, not nine. Steps 3 and 9 concern arranging and completing the actual cross-track validation and remain pending. Steps 10 and 11 now have prepared report and summary deliverables. Step 12 has a prepared README; the corrected PBIX, accessible Drive/GitHub uploads and official submission remain outstanding.

The official guide has 18 Data Analytics activities. The main report and guide_coverage.csv distinguish Covered, Covered with limits, Partial, Prepared, Pending and Not assessable. In particular, exact evaluated revenue-card/group values, some filter paths, current doctor DAX and the proposed feedback-trend refinement have not been fully verified in the user's Power BI session. The seven-field appointment source cannot support an attendance/no-show rate. The guide's named approved resources differ from the continued Week 6 source names; continuity clarification remains outstanding. These limitations are documented rather than marked successful.

Deliverables prepared:
- HealthConnect_Week7_Analytics_Testing_and_Refinement_Report.docx
- HealthConnect_Week7_Project_Summary.docx
- HealthConnect_Week7_Documentation.zip, containing the reports, README, detailed record, SQL and evidence

Overall status: the independent review can be closed within its documented scope. The entire Week 7 assignment is not yet complete. Complete the meaningful cross-track test, add its actual evidence, save/upload the updated PBIX and finish the designated publication/submission steps. Address or explicitly retain the documented application and resource limitations. No grade or full end-to-end validation is claimed.

## 9. User confirmation and README update

The user confirmed that no collaborating colleague has yet been found, so original work-plan steps 3 and 9 remain Pending. The user also confirmed renaming the feedback chart following the review and confirmed making the requested financial-chart changes.

Current status of the discussed steps:
- Step 7: agreed visual changes completed within the review scope. Financial grouping has the supplied post-change screenshot; feedback rename is supported by user confirmation. The exact new feedback title and its chronological sort were not independently inspected.
- Step 8: the financial visual check and evidence retention are complete within the recorded source/screenshot scope. The screenshot supports the corrected pattern, but does not prove each exact financial group value. No new exact numerical comparison is claimed.
- Steps 3 and 9: actual colleague arrangement and cross-track validation remain pending.
- Step 12: README updated for the current Week 7 work. Saving/uploading the corrected PBIX, publication and official submission remain separate user actions.

The report, summary, guide-coverage CSV and original-work-plan CSV were updated consistently. A standalone HealthConnect_Week7_README.md is provided with the same content as the package README.md; use README.md as the filename when adding it to the Week 7 repository folder. The existing report, summary and documentation archive keep their identities. No new Power BI execution or native MySQL test is claimed by this documentation update. Other application-verification and source limitations remain documented.

## 10. Exact financial value confirmation on 1 November 2026

The user supplied [Collected Revenue card screenshot](https://chatgpt.com/library?file_id=libfile_2e0f22474e588191a4d708ee3fcbc968&account_id=personal), image(20261101-163248).png. The visible card displays 8389454556, exactly equal to the independently verified source total 8,389,454,556. T02b is now Pass based on direct screenshot observation, superseding the earlier rounded-card evidence limitation.

The same message states the others match, following the request to compare HF006 = 40,224,830 and DEP181 = 5,681,113 with filters cleared. This is recorded as a user-reported pass for those two sampled group controls under T02d. No exact group tooltip screenshot was supplied, and the statement is not interpreted as confirmation of every DAX definition, slicer interaction or all five open check groups.

Financial values now covered: exact total card observed; HF006 and DEP181 sampled amounts confirmed by the user; earlier financial screenshot retained for the corrected grouping pattern. Existing financial slicer response and clearing/reset behaviour are not separately confirmed. The next requested evidence concerns the existing Total Doctors, Average Patient Satisfaction, Recorded Bed Utilization % and Poor Feedback measures, followed by chronological feedback month order and the remaining reset confirmation.

The main report, summary, README and archive will be finalised together after these remaining checks. This is an update to the active testing record; it does not claim that every document has already been regenerated.

## 11. Measure definitions and financial slicer confirmation on 1 November 2026

The user supplied the four existing formulas below and explicitly answered yes when asked whether the financial facility slicer changes the collected-revenue charts and whether clearing it restores them. That interaction and clearing test is now Pass by user report under T03e. This does not establish the separate patient-selection reset or feedback-month ordering.

```dax
Total Doctors =
CALCULATE(
    DISTINCTCOUNTNOBLANK('Medical Staff'[StaffID]),
    'Medical Staff'[Role] = "Doctor"
)

Average Patient Satisfaction =
AVERAGE('HC_Patient_Feedback'[Rating])

Recorded Bed Utilization % =
DIVIDE(
    COALESCE(
        CALCULATE(
            [Total Beds],
            'Hospital Facilities'[Status] = "Occupied"
        ),
        0
    ),
    [Total Beds]
)

Poor Feedback =
CALCULATE(
    [Total Feedback],
    KEEPFILTERS('HC_Patient_Feedback'[Comment] = "Poor")
)
```

Formula review:
- Total Doctors implements a distinct nonblank StaffID count restricted to Role = Doctor. Its intended population is registered doctors from Medical Staff, resolving the earlier uncertainty about the named measure. Source reference: 350 unfiltered.
- Average Patient Satisfaction implements the arithmetic mean of feedback Rating. Source reference: 2.99 at the agreed two-decimal display precision.
- Recorded Bed Utilization % has the intended occupied-over-total structure. The numerator becomes zero when the Occupied filter finds no beds; with a correct positive Total Beds base count, the supplied all-Available snapshot produces 0%. This is status-snapshot occupancy, not time-based utilisation. The existing Total Beds formula is still needed to confirm the counted entity and denominator.
- Poor Feedback restricts the referenced base measure to Comment = Poor while retaining the intersection with existing filters on that comment field. It matches the stated Poor-comment proxy definition if Total Feedback counts responses correctly. The existing Total Feedback formula is still needed to confirm that base count.

The review checked formula definitions, not native execution by the assistant. The user is asked to supply the two referenced base definitions, Total Beds and Total Feedback, rather than recreate any measures. Remaining application confirmations are chronological feedback months and the separate patient-selection reset.

Function behaviour checked against Microsoft Learn on 1 November 2026:
- https://learn.microsoft.com/en-us/dax/distinctcountnoblank-function-dax
- https://learn.microsoft.com/en-us/dax/average-function-dax
- https://learn.microsoft.com/en-us/dax/divide-function-dax
- https://learn.microsoft.com/en-us/dax/keepfilters-function-dax

## 12. Final closure of the five Power BI check groups on 1 November 2026

The user supplied the two referenced base measures:

```dax
Total Feedback =
COUNTROWS('HC_Patient_Feedback')

Total Beds =
DISTINCTCOUNTNOBLANK('Hospital Facilities'[BedID])
```

These complete the dependency review of the previously supplied Poor Feedback and Recorded Bed Utilization % definitions. A focused source check confirms 2,000 distinct nonblank BedIDs, zero distinct Occupied BedIDs, 21,064 feedback rows and 5,283 Comment Poor rows. The bed formula therefore represents 0% occupied in this source status snapshot. The Poor Feedback definition counts responses with Comment Poor while retaining relevant existing filters. Source controls are not presented as newly observed screenshots of every measure.

The user also answered yes to both explicit questions: feedback trend months are January through December in order, and clearing the Male/Female selection restores the original patient charts. Record these as user-reported passes, separate from direct screenshot observations and assistant-run source calculations.

| Closed check group | Result | Evidence basis |
| --- | --- | --- |
| Exact Collected Revenue card | Pass: 8,389,454,556 | Direct supplied screenshot observation |
| Financial sampled amounts and facility slicer | Pass: HF006 40,224,830; DEP181 5,681,113; slicer responds and restores when cleared | User confirmations against independently calculated controls |
| Six DAX definitions and base dependencies | Pass: intended metric definitions confirmed | User-pasted formulas and source controls |
| Chronological feedback months | Pass: January through December | User confirmation |
| Patient selection clearing | Pass: original charts restored | User confirmation |

No repetition of already passed unchanged tests is requested. The independent review is complete in the agreed scope. This does not assert testing of every possible model path or native execution by the assistant. The earlier local MySQL feedback-table error remains part of the history; the current satisfaction result was verified through the source calculation and supplied DAX definition instead.

Cross-track validation is recorded as **Not completed as of 1 November 2026** because no colleague from another track has been secured. No shared inputs, actual joint test, joint refinement or joint retest has been provided or invented. If a real shared activity is subsequently completed, update this status using its actual result and evidence.

The final report, summary, README, coverage/work-plan CSVs and archive are revised together to reflect this closure, the exact revenue screenshot, the six definitions and the actual collaboration status. The corrected PBIX must still be saved and supplied by the user; the documentation archive contains supporting evidence, not a newly edited PBIX.
