# Reviewed Power BI measures

Provided by the dashboard owner and reviewed on 1 November 2026. These are existing measure definitions, not proof of native DAX execution by the assistant. Interaction, reset and month-order outcomes were confirmed by the user separately.

## Supplied definitions

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
        CALCULATE([Total Beds], 'Hospital Facilities'[Status] = "Occupied"),
        0
    ),
    [Total Beds]
)

Poor Feedback =
CALCULATE(
    [Total Feedback],
    KEEPFILTERS('HC_Patient_Feedback'[Comment] = "Poor")
)

Total Feedback =
COUNTROWS('HC_Patient_Feedback')

Total Beds =
DISTINCTCOUNTNOBLANK('Hospital Facilities'[BedID])
```

## Unfiltered source controls

| Metric | Source reference | Interpretation |
| --- | ---: | --- |
| Registered doctors | 350 | Unique nonblank StaffID with Role Doctor |
| Average satisfaction | 2.99 | Mean Rating rounded to two decimals |
| Total beds | 2,000 | Unique nonblank BedID |
| Total feedback | 21,064 | One row per recorded response |
| Recorded bed utilisation | 0% | All source beds Available; status snapshot only |
| Poor feedback | 5,283 | Responses whose Comment is Poor |

The source controls establish expected values for the stated population. The exact Collected Revenue card and two financial group comparisons have separate evidence. No new screenshot of a Poor Feedback card or a Total Beds card was supplied or claimed.
