Customer Support Quality Analysis — Data Analysis Set B
Student Name: Roshan Marathe
Student ID: 10258
Assigned Set: Set A
Project: Customer Support Quality Analysis
1. Business Objective
The objective of this practical is to analyze customer-support ticket data using Excel, SQL, Python, and Power BI.
The analysis addresses the assignment's business question:
Which support team should improve resolution performance, and how does service quality vary by channel?

The work uses the supplied synthetic tickets.csv fact data and teams.csv lookup data.
2. Business Questions Answered
1. Which support team(s) show the highest SLA-breach rate and therefore require attention to resolution performance?
2. How does service quality vary by support channel, particularly in terms of SLA breaches?
3. Dataset
Input files
File	Purpose	Records
data/raw/tickets.csv	Fact table containing support tickets	13 supplied rows, including 1 duplicate
data/raw/teams.csv	Lookup table containing team and department information	4 rows


After removing the intentional exact duplicate from the fact table, the clean ticket dataset contains 12 unique records.
Data dictionary — tickets.csv
Column	Type	Meaning
ticket_id	Integer	Unique ticket identifier
month	Text / ordered category	Ticket month; order is Jan → Feb → Mar
team_id	Text	Team lookup key
channel	Text	Support channel: Email, Chat, or Phone
resolution_hours	Numeric	Time taken to resolve the ticket, in hours
satisfaction	Numeric	Customer satisfaction score on a 1–5 scale


Data dictionary — teams.csv
Column	Type	Meaning
team_id	Text	Team lookup key
team	Text	Support team name
department	Text	Department to which the team belongs


Team mapping
Team ID	Team	Department
T1	AccountCare	Service
T2	BillingHelp	Service
T3	AppSupport	Technical
T4	DeviceHelp	Technical


4. Data Cleaning and Metric Definitions
The same calculation rules were followed across the four tools.
Cleaning
1. The supplied raw ticket data contains 13 rows, including one intentional exact duplicate.
2. The duplicate ticket row for ticket_id = 12 was removed.
3. The resulting clean dataset contains 12 unique ticket records.
4. team_id was used as the lookup/join key.
5. The team lookup was used to add the department/team information.
6. Numeric fields were kept as numeric values.
7. Month order was treated as Jan → Feb → Mar.
Duplicate rule
The exact duplicate is:
12,Mar,T4,Phone,24,5
It appears twice in the supplied fact file and is retained only once in the clean data.
Breach flag
The assignment defines:
breach_flag = 1 when resolution_hours > 24
breach_flag = 0 otherwise
Therefore, exactly 24 hours meets the SLA and is not a breach.
SLA breach rate
SLA Breach Rate =
Number of tickets with resolution_hours > 24
---------------------------------------------
Total number of tickets
The rate is reported as a percentage.
5. Excel Analysis
The workbook is:
excel/analysis.xlsx
It contains the required sheets:
- Raw
- Lookup
- Clean
- Summary
Excel work completed
- Raw ticket data retained with the original 13 supplied rows.
- Team lookup data contains 4 rows.
- Duplicate removed in the Clean data, leaving 12 unique records.
- Department added using the team lookup.
- breach_flag calculated using the required IF rule.
- Channel breach counts calculated.
- PivotTable created for average resolution hours by department and month.
- Monthly order used: Jan → Feb → Mar.
Channel breach results
Channel	Breached Tickets
Email	0
Chat	3
Phone	2


Excel PivotTable — Average Resolution Hours
Department	Jan	Feb	Mar	Overall
Service	20.00	19.00	19.00	19.33
Technical	28.00	29.00	28.00	28.33
Overall	24.00	24.00	23.50	23.83


The supplied Python chart also shows the monthly averages as:
- Jan: 24.00 hours
- Feb: 24.00 hours
- Mar: 23.50 hours
6. SQL Analysis
The SQL deliverables are:
sql/setup.sql
sql/queries.sql
The required execution order is:
1. Run sql/setup.sql
2. Run sql/queries.sql
The SQL work uses the teams table as the lookup table and the tickets table as the fact table.
S2a — Average Resolution Time by Department
Department	Average Resolution Hours
Technical	28.33
Service	19.33


The Technical department has the higher average resolution time in the supplied data.
S2b — Teams Breaching SLA
The teams whose average resolution time exceeds 24 hours are:
Team	Average Resolution Hours
AppSupport	28.67
DeviceHelp	28.00
BillingHelp	26.67


S2c — Top Two Channels by Breach Count
Channel	Breach Count
Chat	3
Phone	2


Alphabetical ordering is used as the tie-breaking rule when required by the assignment.
S3 — Data Integrity Check
The SQL diagnostic check returned an empty result set, meaning there were zero unmatched team IDs between the ticket fact data and team lookup data.
7. Python Analysis
The Python deliverables are under:
python/
outputs/
The assignment requires pandas and matplotlib.
Python workflow
1. Load the two raw CSV files using repository-relative paths.
2. Confirm numeric fields.
3. Remove the exact duplicate ticket.
4. Merge tickets with teams using team_id.
5. Confirm that the merged dataset contains exactly 12 rows.
6. Confirm that no department values are missing after the merge.
7. Create breach_flag.
8. Create the department breach-rate summary.
9. Identify the team with the highest breach rate.
10. Create the monthly average resolution-time chart.
11. Export the clean merged data and Python summary.
Department breach-rate summary
Department	Total Tickets	Breached Tickets	SLA Breach Rate
Service	6	2	33.33%
Technical	6	3	50.00%


Team breach-rate analysis
Team	Breached Tickets	Total Tickets	SLA Breach Rate
AccountCare	0	3	0.00%
BillingHelp	2	3	66.67%
AppSupport	2	3	66.67%
DeviceHelp	1	3	33.33%


The highest team breach rate is a tie between BillingHelp and AppSupport: 2 breached tickets out of 3 (66.67%) each.
Monthly average resolution time
Month	Average Resolution Hours
Jan	24.00
Feb	24.00
Mar	23.50


The submitted chart is saved as:
outputs/python_chart.png
The required Python exports are:
outputs/clean_data.csv
outputs/python_summary.csv
8. Power BI Analysis
The Power BI deliverable is:
powerbi/dashboard.pbix
The report is based on the supplied ticket and team CSV data.
Required Power Query/Data Model work
- Correct data types applied.
- Exact duplicate removed from the tickets data.
- 12 clean ticket rows retained.
- Active one-to-many relationship:
  - teams[team_id] → tickets[team_id]
- Single-direction filtering from teams to tickets.
Required DAX measures
Ticket Count
Ticket Count = COUNTROWS(tickets)
Avg Satisfaction
Avg Satisfaction = AVERAGE(tickets[satisfaction])
SLA Breach Rate
SLA Breach Rate =
DIVIDE(
    COUNTROWS(
        FILTER(
            tickets,
            tickets[resolution_hours] > 24
        )
    ),
    COUNTROWS(tickets),
    0
)
The SLA Breach Rate measure is formatted as a percentage in the report.
Report page requirements
The report page contains the required analysis components:
- Ticket Count KPI card
- Avg Satisfaction KPI card
- SLA Breach Rate KPI card
- Department comparison visual
- Monthly resolution-time trend
- Channel slicer
The report is intended to use the channel slicer to filter the cards and charts.
The Power BI dashboard output is required at:
outputs/powerbi_dashboard.png
9. Key Results
The following results are calculated from the 12 unique ticket records after duplicate removal.
Finding 1 — Department resolution performance
The Technical department has an average resolution time of 28.33 hours, compared with 19.33 hours for the Service department.
Finding 2 — Team SLA-breach performance
BillingHelp and AppSupport are tied for the highest SLA-breach rate at 66.67%, with 2 breached tickets out of 3 for each team.
Channel result
Chat has 3 SLA-breached tickets, followed by Phone with 2, while Email has 0 breached tickets.
10. Recommendation
Based on the supplied 12-record dataset, resolution-performance review should be prioritized for BillingHelp and AppSupport, because both teams have the highest observed SLA-breach rate at 66.67%.
The channel results also indicate that Chat accounts for the highest number of SLA-breached tickets, so Chat-resolution cases should be included in the review.
Limitation
The analysis is based on a small synthetic dataset containing only 12 unique ticket records. Therefore, the findings describe this practical's supplied data and should not be generalized to a larger production customer-support population without additional data.
11. Cross-Tool Reconciliation
The assignment requires at least one aggregate to be checked across Excel, SQL, Python, and Power BI.
The selected aggregate is:
Average resolution time for the Technical department

Tool	Result
Excel PivotTable	28.33 hours
SQL S2a	28.33 hours
Python calculation from clean data	28.33 hours
Power BI — Technical filter	28.33 hours


The underlying value is approximately 28.3333 hours. The README reports it to two decimal places, following the assignment's reporting rule.
No substantive difference is expected between the tools; any displayed difference beyond this is only a rounding/display-format difference.
12. Repository Structure
The repository follows the structure required by the practical assignment:
data-analysis-set-e-YOUR-STUDENT-ID/
│
├── README.md
├── requirements.txt
├── .gitignore
│
├── data/
│   └── raw/
│       ├── tickets.csv
│       └── teams.csv
│
├── excel/
│   └── analysis.xlsx
│
├── sql/
│   ├── setup.sql
│   └── queries.sql
│
├── python/
│   └── analysis.py
│
├── powerbi/
│   └── dashboard.pbix
│
└── outputs/
    ├── clean_data.csv
    ├── python_summary.csv
    ├── python_chart.png
    ├── powerbi_dashboard.png
    │
    └── sql/
        ├── s2a_avg_resolution_by_department.csv
        ├── s2b_teams_breaching_sla.csv
        ├── s2c_top_two_channels_by_breach_count.csv
        └── s3_data_integrity_check.csv
13. Setup and Run Instructions
Python
From the repository root:
pip install -r requirements.txt
Run the analysis:
python python/analysis.py
The Python script should use repository-relative paths so that it can run after cloning the repository on another computer.
SQL
Run the files in this order:
1. sql/setup.sql
2. sql/queries.sql
setup.sql creates the required tables and loads the clean 12 ticket records and 4 team records.
queries.sql contains the three labeled analytical queries:
- S2a
- S2b
- S2c
The SQL engine and version should be stated in sql/setup.sql and updated here if necessary.
Excel
Open:
excel/analysis.xlsx
The workbook contains:
- Raw — original supplied 13-row ticket data
- Lookup — 4-row team lookup data
- Clean — duplicate-free data with lookup and derived fields
- Summary — channel breach counts, PivotTable, and chart
The formulas and PivotTable remain editable in the workbook.
Power BI
Open:
powerbi/dashboard.pbix
The report uses the CSV files from:
data/raw/tickets.csv
data/raw/teams.csv
After cloning the repository to another computer:
1. Open the PBIX file.
2. If Power BI reports a missing source path, update the CSV source paths to the local repository's data/raw/ folder.
3. Refresh the data.
4. Verify that the duplicate is removed and 12 ticket rows remain.
5. Verify the teams[team_id] → tickets[team_id] relationship.
6. Verify the report visuals and channel slicer.
14. Outputs
The repository should contain the following required outputs:
outputs/clean_data.csv
outputs/python_summary.csv
outputs/python_chart.png
outputs/powerbi_dashboard.png
outputs/sql/
The SQL output folder contains the three analytical query results and the data-integrity result.
15. Video
The practical assignment requires a 5–10 minute explanation video with the student's face visible through a webcam overlay while the screen is recorded.
Video URL
<PASTE WORKING VIDEO URL HERE>
Duration
<ENTER VIDEO DURATION HERE>
The video should demonstrate:
- Business problem
- Dataset structure
- Duplicate handling
- Excel XLOOKUP and breach flag
- Excel PivotTable
- One SQL query and its logic
- Python merge/assertion and breach flag
- Python chart
- Power BI DAX measure
- Power BI channel slicer
- Two numeric findings
- Recommendation
- Limitation
- Repository structure

**Author:** Roshan Marathe  
**Role:** AI/ML Student
