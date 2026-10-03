<div align="center">

📊 Customer Support Quality Analysis
Data Analysis Practical — Set B
<img src="https://readme-typing-svg.demolab.com?font=Fira+Code&size=24&duration=2500&pause=800&color=6C63FF&center=true&vCenter=true&width=700&lines=Roshan+Marathe;AI%2FML+Student;Data+Analytics+%7C+Python+%7C+SQL;Excel+%7C+Power+BI+%7C+Machine+Learning" alt="Animated introduction"/>


<img src="https://img.shields.io/badge/Author-Roshan%20Marathe-6C63FF?style=for-the-badge&logo=github&logoColor=white"/>
<img src="https://img.shields.io/badge/Role-AI%2FML%20Student-00C9A7?style=for-the-badge&logo=python&logoColor=white"/>
<img src="https://img.shields.io/badge/Project-Data%20Analysis-FF6B6B?style=for-the-badge&logo=googleanalytics&logoColor=white"/>
<img src="https://img.shields.io/badge/Set-B-4A90E2?style=for-the-badge"/>




Excel • SQL • Python • Power BI
</div>

👨‍💻 Author
Roshan Marathe
Role: AI/ML Student
🎯 Project Overview
This project is a practical Customer Support Quality Analysis completed using four required analytical tools:
- 📗 Microsoft Excel
- 🗄️ SQL
- 🐍 Python
- 📊 Power BI
The analysis uses the supplied synthetic customer-support datasets to examine resolution performance, SLA breaches, departments, teams, and support channels.
Business Question
Which support team should improve resolution performance, and how does service quality vary by channel?

🧭 Business Questions
This project answers the following questions:
1. Which support team(s) show the highest SLA-breach rate and therefore require attention to resolution performance?
2. How does service quality vary by support channel, particularly in terms of SLA breaches?
📁 Project Structure
data-analysis-set-e-YOUR-STUDENT-ID/
│
├── 📄 README.md
├── 📄 requirements.txt
├── 📄 .gitignore
│
├── 📂 data/
│   └── 📂 raw/
│       ├── tickets.csv
│       └── teams.csv
│
├── 📂 excel/
│   └── analysis.xlsx
│
├── 📂 sql/
│   ├── setup.sql
│   └── queries.sql
│
├── 📂 python/
│   └── analysis.py
│
├── 📂 powerbi/
│   └── dashboard.pbix
│
└── 📂 outputs/
    ├── clean_data.csv
    ├── python_summary.csv
    ├── python_chart.png
    ├── powerbi_dashboard.png
    │
    └── 📂 sql/
        ├── s2a_avg_resolution_by_department.csv
        ├── s2b_teams_breaching_sla.csv
        ├── s2c_top_two_channels_by_breach_count.csv
        └── s3_data_integrity_check.csv
📦 Dataset
Input Files
File	Purpose	Records
tickets.csv	Customer-support ticket fact table	13 supplied rows
teams.csv	Team and department lookup table	4 rows


The supplied tickets.csv contains 13 rows including one intentional exact duplicate.
After cleaning:
13 rows → 12 unique records

🧾 Data Dictionary — Tickets
Column	Type	Description
ticket_id	Integer	Unique ticket identifier
month	Text / Ordered Category	Ticket month: Jan → Feb → Mar
team_id	Text	Lookup key for the support team
channel	Text	Email, Chat, or Phone
resolution_hours	Numeric	Time required to resolve a ticket
satisfaction	Numeric	Customer satisfaction score from 1–5


🧾 Data Dictionary — Teams
Column	Type	Description
team_id	Text	Team lookup key
team	Text	Support team name
department	Text	Service or Technical


Team Mapping
Team ID	Team	Department
T1	AccountCare	Service
T2	BillingHelp	Service
T3	AppSupport	Technical
T4	DeviceHelp	Technical


🧹 Data Cleaning
The same data-cleaning rules were followed across Excel, SQL, Python, and Power BI.
Cleaning Workflow
Raw Tickets
    │
    ▼
13 supplied rows
    │
    ▼
Remove exact duplicate
    │
    ▼
12 unique tickets
    │
    ▼
Join with Teams using team_id
    │
    ▼
Add department
    │
    ▼
Create breach_flag
    │
    ▼
Analysis & Visualization
Duplicate Removed
The intentional duplicate was:
12,Mar,T4,Phone,24,5
The duplicate was removed so that the clean dataset contains exactly 12 records.
🚦 SLA Definition
Breach Flag
The assignment defines:
breach_flag = 1 when resolution_hours > 24
breach_flag = 0 otherwise
Therefore:
Exactly 24 hours meets the SLA and is not a breach.

SLA Breach Rate
SLA Breach Rate =
Number of tickets where resolution_hours > 24
----------------------------------------------
Total number of tickets
The final rate is reported as a percentage.
📗 Excel Analysis
Workbook
excel/analysis.xlsx
Required Sheets
Sheet	Purpose
Raw	Original 13-row ticket data
Lookup	4-row team lookup data
Clean	Duplicate-free data + lookup + breach flag
Summary	Channel summary + PivotTable + chart


Excel Operations
- Raw data imported without changing supplied values.
- Lookup table added.
- Exact duplicate removed.
- Before/after row counts recorded.
- Department populated using XLOOKUP / lookup logic.
- breach_flag calculated using the required IF formula.
- Channel breach counts calculated using COUNTIFS.
- PivotTable created for average resolution hours by department and month.
- Month order maintained as Jan → Feb → Mar.
📊 Channel Breach Results
Channel	Breached Tickets
Email	0
Chat	3
Phone	2


Visual Summary
Chat   ██████████████████████████████  3
Phone  ████████████████████            2
Email                                      0
📈 Excel PivotTable Results
Average Resolution Hours
Department	Jan	Feb	Mar	Overall
Service	20.00	19.00	19.00	19.33
Technical	28.00	29.00	28.00	28.33
Overall	24.00	24.00	23.50	23.83


🗄️ SQL Analysis
SQL Files
sql/setup.sql
sql/queries.sql
Execution Order
1️⃣ setup.sql
       ↓
2️⃣ queries.sql
The database is created and populated first, followed by the analytical queries.
S2a — Average Resolution Time by Department
Department	Average Resolution Hours
Technical	28.33
Service	19.33


S2b — Teams Breaching SLA
Teams with an average resolution time greater than 24 hours:
Team	Average Resolution Hours
AppSupport	28.67
DeviceHelp	28.00
BillingHelp	26.67


S2c — Top Two Channels by Breach Count
Channel	Breach Count
Chat	3
Phone	2


S3 — Data Integrity
A LEFT JOIN diagnostic check was used to verify that all ticket team_id values have matching records in the teams lookup table.
Result
Unmatched team IDs: 0
This confirms that the ticket fact records have matching lookup records.
🐍 Python Analysis
Python Deliverable
python/analysis.py
The analysis uses:
- pandas
- matplotlib
🔄 Python Workflow
Load CSV Files
      │
      ▼
Check Data Types
      │
      ▼
Remove Duplicate
      │
      ▼
Merge Tickets + Teams
      │
      ▼
Validate 12 Rows
      │
      ▼
Create breach_flag
      │
      ▼
Department Analysis
      │
      ▼
Team Breach Analysis
      │
      ▼
Monthly Resolution Chart
      │
      ▼
Export Results
📊 Python Department Summary
Department	Total Tickets	Breached Tickets	SLA Breach Rate
Service	6	2	33.33%
Technical	6	3	50.00%


🏆 Team SLA Breach Analysis
Team	Breached	Total	Breach Rate
AccountCare	0	3	0.00%
BillingHelp	2	3	66.67%
AppSupport	2	3	66.67%
DeviceHelp	1	3	33.33%


Highest Observed Breach Rate
BillingHelp and AppSupport are tied:
2 breached tickets / 3 total tickets
= 66.67%
📅 Monthly Resolution Analysis
Month	Average Resolution Hours
Jan	24.00
Feb	24.00
Mar	23.50


The month order is maintained as:
Jan → Feb → Mar
Python Chart
The required chart is saved at:
outputs/python_chart.png
📤 Python Outputs
outputs/clean_data.csv
outputs/python_summary.csv
outputs/python_chart.png
📊 Power BI Analysis
Power BI File
powerbi/dashboard.pbix
🔧 Power Query
The Power Query workflow includes:
- Correct data types
- Duplicate removal
- 12 clean ticket records
- Team lookup data
- Data preparation for the report
🔗 Data Model
Required relationship:
teams
  │
  │ 1
  │
  │
  ▼ *
tickets
Relationship:
teams[team_id]
      ↓
tickets[team_id]
Filtering direction:
Teams → Tickets
🧮 DAX Measures
Ticket Count
Ticket Count = COUNTROWS(tickets)
Average Satisfaction
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
📌 Power BI Report
The report page contains the required:
- 🎯 Ticket Count KPI
- ⭐ Average Satisfaction KPI
- 🚨 SLA Breach Rate KPI
- 📊 Department comparison chart
- 📈 Monthly resolution trend
- 🎛️ Channel slicer
The channel slicer is designed to filter the cards and charts simultaneously.
Screenshot:
outputs/powerbi_dashboard.png
🔍 Key Findings
1. Department Resolution Performance
The Technical department has an average resolution time of:
28.33 hours
The Service department has:
19.33 hours
2. Highest Team SLA-Breach Rate
Two teams are tied for the highest observed breach rate:
BillingHelp → 66.67%
AppSupport  → 66.67%
Each has:
2 breached tickets
out of
3 total tickets
3. Channel SLA Breaches
Chat   → 3 breaches
Phone  → 2 breaches
Email  → 0 breaches
Chat has the highest number of breached tickets in this dataset.
💡 Recommendation
Based on the supplied 12 unique ticket records, the resolution-performance review should focus on BillingHelp and AppSupport, which have the highest observed SLA-breach rate of 66.67%.
The channel analysis also indicates that Chat has the highest number of SLA-breached tickets, so Chat-resolution cases should be included in the review.
⚠️ Limitation
The dataset contains only 12 unique ticket records and is synthetic. Therefore, these results describe the supplied practical dataset and should not be generalized to a larger production customer-support population without additional data.
🔄 Cross-Tool Reconciliation
The selected aggregate for reconciliation is:
Average resolution time for the Technical department

Tool	Result
📗 Excel	28.33 hours
🗄️ SQL	28.33 hours
🐍 Python	28.33 hours
📊 Power BI	28.33 hours


Reconciliation Result
Excel   = 28.33
SQL     = 28.33
Python  = 28.33
PowerBI = 28.33
The underlying calculation is approximately 28.3333 hours and is displayed as 28.33 hours according to the assignment's two-decimal reporting rule.
🛠️ Tools & Technologies
<div align="center">

<img src="https://img.shields.io/badge/Python-3.x-3776AB?style=for-the-badge&logo=python&logoColor=white"/>
<img src="https://img.shields.io/badge/Pandas-Data%20Analysis-150458?style=for-the-badge&logo=pandas&logoColor=white"/>
<img src="https://img.shields.io/badge/Matplotlib-Visualization-11557C?style=for-the-badge"/>
<img src="https://img.shields.io/badge/SQL-Database-4479A1?style=for-the-badge&logo=mysql&logoColor=white"/>
<img src="https://img.shields.io/badge/Excel-Analysis-217346?style=for-the-badge&logo=microsoftexcel&logoColor=white"/>
<img src="https://img.shields.io/badge/Power%20BI-Dashboard-F2C811?style=for-the-badge&logo=powerbi&logoColor=black"/>

</div>

⚙️ Setup & Run
1. Clone Repository
git clone <YOUR-GITHUB-REPOSITORY-URL>
cd data-analysis-set-e-YOUR-STUDENT-ID
2. Python Environment
Install the required Python packages:
pip install -r requirements.txt
Run the Python analysis from the repository root:
python python/analysis.py
The script should use relative paths such as:
pd.read_csv("data/raw/tickets.csv")
3. SQL
Run:
sql/setup.sql
first.
Then run:
sql/queries.sql
The SQL files should be executed in this order so the tables and data exist before the analytical queries run.
4. Excel
Open:
excel/analysis.xlsx
The workbook contains:
Raw
Lookup
Clean
Summary
All formulas and the PivotTable should remain editable.
5. Power BI
Open:
powerbi/dashboard.pbix
The report uses:
data/raw/tickets.csv
data/raw/teams.csv
If the repository is cloned to another computer, update the CSV source paths if Power BI cannot locate them, then refresh the report.
🎥 Project Explanation Video
The practical requires a 5–10 minute explanation video with face and screen visible simultaneously.
Video URL
<PASTE WORKING VIDEO URL HERE>
Duration
<ENTER VIDEO DURATION HERE>
Recommended Demonstration
The video should show:
1. 👋 Introduction
2. 📦 Dataset structure
3. 🧹 Duplicate removal
4. 📗 Excel XLOOKUP and breach_flag
5. 📊 Excel PivotTable
6. 🗄️ SQL query
7. 🐍 Python merge and validation
8. 📈 Python chart
9. 📊 Power BI DAX measure
10. 🎛️ Power BI channel slicer
11. 🔢 Two numeric findings
12. 💡 Recommendation
13. ⚠️ Limitation
14. 📁 Repository structure
🔢 Tools & Versions
Tool	Version
Microsoft Excel	<ENTER VERSION USED>
Power BI Desktop	<ENTER VERSION USED>
SQL Engine	<ENTER ENGINE + VERSION>
Python	<ENTER VERSION USED>
pandas	<ENTER VERSION USED>
matplotlib	<ENTER VERSION USED>


Replace the placeholders with the actual versions used for the submitted project.

📚 References
Primary project specification:
Practical Exam — Data Analysis — Set B — Customer Support Quality Analysis
The project uses the supplied synthetic datasets.
If external code or resources were used, document them below:
<ADD EXTERNAL REFERENCES HERE, IF ANY>
✍️ Authorship
<div align="center">

👨‍💻 Roshan Marathe
AI/ML Student
📊 Data Analytics • 🐍 Python • 🧠 Machine Learning • 📈 Visualization

All work in this repository is my own except where cited.

</div>

✅ Final Submission Checklist
- [ ] Public GitHub repository opens while signed out.
- [ ] README.md is present.
- [ ] requirements.txt is present.
- [ ] .gitignore is present.
- [ ] Raw 13-row ticket data is present.
- [ ] Clean 12-row data is present.
- [ ] excel/analysis.xlsx is present and editable.
- [ ] sql/setup.sql is present.
- [ ] sql/queries.sql is present.
- [ ] Python analysis file is present.
- [ ] powerbi/dashboard.pbix is present.
- [ ] outputs/clean_data.csv is present.
- [ ] outputs/python_summary.csv is present.
- [ ] outputs/python_chart.png is present.
- [ ] outputs/powerbi_dashboard.png is present.
- [ ] SQL output files are present.
- [ ] SQL setup runs before SQL queries.
- [ ] Python runs from repository root.
- [ ] Power BI source paths are documented.
- [ ] Power BI report refreshes successfully.
- [ ] Video URL is accessible.
- [ ] Video duration is 5–10 minutes.
- [ ] Cross-tool reconciliation is documented.
- [ ] Final commit hash is recorded.
<div align="center">

🚀 Data → Analysis → Insight → Decision
Built by Roshan Marathe | AI/ML Student
<img src="https://capsule-render.vercel.app/api?type=waving&color=6C63FF&height=120&section=footer" width="100%"/>

</div>
