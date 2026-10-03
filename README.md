<div align="center">

<img src="https://capsule-render.vercel.app/api?type=waving&height=230&color=gradient&customColorList=12,14,18,24&text=Customer%20Support%20Quality%20Analysis&fontSize=38&fontColor=ffffff&animation=fadeIn&fontAlignY=38&desc=Excel%20%E2%80%A2%20SQL%20%E2%80%A2%20Python%20%E2%80%A2%20Power%20BI&descAlignY=58&descSize=18" width="100%" alt="Customer Support Quality Analysis banner"/>

<a href="https://git.io/typing-svg"><img src="https://readme-typing-svg.demolab.com?font=Fira+Code&weight=600&size=20&duration=3000&pause=1000&color=2F81F7&center=true&vCenter=true&width=720&lines=Which+support+team+should+improve+resolution%3F;How+does+service+quality+vary+by+channel%3F;One+dataset.+Four+tools.+Fully+reconciled+results." alt="Typing animation"/></a>

<br/>

![Excel](https://img.shields.io/badge/Excel-217346?style=for-the-badge&logo=microsoftexcel&logoColor=white)
![SQL](https://img.shields.io/badge/SQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white)
![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)
![pandas](https://img.shields.io/badge/pandas-150458?style=for-the-badge&logo=pandas&logoColor=white)
![Power BI](https://img.shields.io/badge/Power%20BI-F2C811?style=for-the-badge&logo=powerbi&logoColor=black)
![Records](https://img.shields.io/badge/Clean%20Records-12-3b82f6?style=for-the-badge)
![SLA](https://img.shields.io/badge/SLA%20Breach-%3E%2024%20hrs-ef4444?style=for-the-badge)

**Data Analysis Practical Exam — Set A**

</div>

---

<img src="https://capsule-render.vercel.app/api?type=rect&height=45&color=gradient&customColorList=12,14,18&section=header&text=Executive%20Summary&fontSize=22&fontColor=ffffff&animation=fadeIn" width="100%" alt="Executive Summary"/>

This project analyzes **12 unique customer-support tickets** to answer one business question:

> **Which support team should improve resolution performance, and how does service quality vary by channel?**

The same cleaned data flows through Excel, SQL, Python and Power BI, and the key result is reconciled across all four tools.

| | Finding | Result |
|:-:|:--|:--|
| 🎯 | Highest SLA-breach teams | **BillingHelp** and **AppSupport** — **66.67%** each (2 of 3 tickets) |
| 📞 | Channel with most breaches | **Chat** — 3 breaches (Phone 2, Email 0) |
| ⏱️ | Slowest department | **Technical** — 28.33 hrs vs. 19.33 hrs for Service |
| ✅ | Cross-tool check | Technical average = **28.33 hrs** in all four tools |

> **SLA rule:** a ticket breaches the SLA only when `resolution_hours > 24`. Exactly 24 hours is compliant.

---

<img src="https://capsule-render.vercel.app/api?type=rect&height=45&color=gradient&customColorList=12,14,18&section=header&text=Data%20%26%20Preparation&fontSize=22&fontColor=ffffff&animation=fadeIn" width="100%" alt="Data and Preparation"/>

```mermaid
flowchart LR
    A[("tickets.csv<br/>13 rows")] --> B{{"Remove exact<br/>duplicate"}}
    T[("teams.csv<br/>4 rows")] --> C["Join on team_id"]
    B --> C
    C --> D["12 clean tickets<br/>+ breach_flag"]
    D --> E[Excel]
    D --> F[SQL]
    D --> G[Python]
    D --> H[Power BI]
    E --> I(["Reconciled<br/>result"])
    F --> I
    G --> I
    H --> I
    style I fill:#2F81F7,color:#fff,stroke:#2F81F7
```

| Check | Result |
|:--|:-:|
| Source ticket rows | 13 |
| Exact duplicate removed (`12,Mar,T4,Phone,24,5`) | 1 |
| **Clean ticket rows** | **12** |
| Unmatched team IDs after join | **0** |
| Missing departments after join | **0** |

| Team ID | Team | Department |
|:-:|:--|:--|
| T1 | AccountCare | Service |
| T2 | BillingHelp | Service |
| T3 | AppSupport | Technical |
| T4 | DeviceHelp | Technical |

---

<img src="https://capsule-render.vercel.app/api?type=rect&height=45&color=gradient&customColorList=12,14,18&section=header&text=Results%20at%20a%20Glance&fontSize=22&fontColor=ffffff&animation=fadeIn" width="100%" alt="Results at a Glance"/>

```mermaid
xychart-beta
    title "Average Resolution Time by Department (hours) — SLA line at 24"
    x-axis [Service, Technical]
    y-axis "Hours" 0 --> 32
    bar [19.33, 28.33]
    line [24, 24]
```

```mermaid
xychart-beta
    title "SLA Breach Rate by Team (%)"
    x-axis ["AccountCare", "BillingHelp", "AppSupport", "DeviceHelp"]
    y-axis "Breach rate (%)" 0 --> 100
    bar [0, 66.67, 66.67, 33.33]
```

```mermaid
xychart-beta
    title "SLA-Breached Tickets by Channel"
    x-axis [Email, Chat, Phone]
    y-axis "Breached tickets" 0 --> 4
    bar [0, 3, 2]
```

---

<img src="https://capsule-render.vercel.app/api?type=rect&height=45&color=gradient&customColorList=33,22,28&section=header&text=1%20%C2%B7%20Excel%20Analysis&fontSize=22&fontColor=ffffff&animation=fadeIn" width="100%" alt="Excel Analysis"/>

**File:** `excel/analysis.xlsx`

| Sheet | Purpose |
|:--|:--|
| `Raw` | Original 13-row ticket extract, unchanged |
| `Lookup` | 4-row team and department reference |
| `Clean` | 12 deduplicated rows with department and `breach_flag` |
| `Summary` | Channel breach counts, department × month PivotTable, chart |

**Key formulas**

```excel
=XLOOKUP([@team_id], Lookup[team_id], Lookup[department], "Not found")
=IF([@resolution_hours]>24, 1, 0)
=COUNTIFS(Clean[channel], A2, Clean[breach_flag], 1)
```

**Channel breaches**

| Channel | Breached Tickets |
|:--|:-:|
| Email | 0 |
| Chat | **3** |
| Phone | **2** |

**PivotTable — average resolution hours**

| Department | Jan | Feb | Mar | Overall |
|:--|:-:|:-:|:-:|:-:|
| Service | 20.00 | 19.00 | 19.00 | 19.33 |
| Technical | 28.00 | 29.00 | 28.00 | **28.33** |
| **Overall** | 24.00 | 24.00 | 23.50 | 23.83 |

> 💡 Technical stays above 24 hours in every month, which points to a department-specific issue rather than a time trend.

---

<img src="https://capsule-render.vercel.app/api?type=rect&height=45&color=gradient&customColorList=6,3,12&section=header&text=2%20%C2%B7%20SQL%20Analysis&fontSize=22&fontColor=ffffff&animation=fadeIn" width="100%" alt="SQL Analysis"/>

**Files:** `sql/setup.sql` → `sql/queries.sql` (run in this order)

**S2a — Average resolution time by department**

```sql
SELECT tm.department,
       ROUND(AVG(t.resolution_hours), 2) AS avg_resolution_hours
FROM tickets AS t
JOIN teams   AS tm ON t.team_id = tm.team_id
GROUP BY tm.department
ORDER BY avg_resolution_hours DESC;
```

| Department | Avg Resolution Hours |
|:--|:-:|
| Technical | **28.33** |
| Service | **19.33** |

**S2b — Teams averaging more than 24 hours**

```sql
SELECT tm.team,
       ROUND(AVG(t.resolution_hours), 2) AS avg_resolution_hours
FROM tickets AS t
JOIN teams   AS tm ON t.team_id = tm.team_id
GROUP BY tm.team
HAVING AVG(t.resolution_hours) > 24
ORDER BY avg_resolution_hours DESC;
```

| Team | Avg Resolution Hours |
|:--|:-:|
| AppSupport | 28.67 |
| DeviceHelp | 28.00 |
| BillingHelp | 26.67 |

**S2c — Top two channels by breach count** *(alphabetical tie-break)*

```sql
SELECT channel, COUNT(*) AS breach_count
FROM tickets
WHERE resolution_hours > 24
GROUP BY channel
ORDER BY breach_count DESC, channel
LIMIT 2;
```

| Channel | Breach Count |
|:--|:-:|
| Chat | **3** |
| Phone | **2** |

**S3 — Data integrity check:** the check for unmatched team IDs returned an **empty result** — every ticket maps to a valid team.

---

<img src="https://capsule-render.vercel.app/api?type=rect&height=45&color=gradient&customColorList=2,1,12&section=header&text=3%20%C2%B7%20Python%20Analysis&fontSize=22&fontColor=ffffff&animation=fadeIn" width="100%" alt="Python Analysis"/>

**File:** `python/analysis.py` — built with `pandas` and `matplotlib`, using repository-relative paths.

```python
from pathlib import Path
import pandas as pd

ROOT = Path(__file__).resolve().parents[1]
tickets = pd.read_csv(ROOT / "data" / "raw" / "tickets.csv").drop_duplicates()
teams   = pd.read_csv(ROOT / "data" / "raw" / "teams.csv")

df = tickets.merge(teams, on="team_id", how="left", validate="many_to_one")

assert len(df) == 12, "Clean dataset must contain 12 rows"
assert df["department"].notna().all(), "Every ticket must map to a department"

df["breach_flag"] = (df["resolution_hours"] > 24).astype(int)
```

**Department summary**

| Department | Tickets | Breached | Breach Rate |
|:--|:-:|:-:|:-:|
| Service | 6 | 2 | 33.33% |
| Technical | 6 | 3 | 50.00% |

**Team summary**

| Team | Breached | Total | Breach Rate |
|:--|:-:|:-:|:-:|
| AccountCare | 0 | 3 | 0.00% |
| **BillingHelp** | **2** | 3 | **66.67%** |
| **AppSupport** | **2** | 3 | **66.67%** |
| DeviceHelp | 1 | 3 | 33.33% |

**Monthly average resolution time**

<div align="center">

<img src="outputs/python_chart.png" width="75%" alt="Python chart — monthly average resolution time"/>

</div>

| Jan | Feb | Mar |
|:-:|:-:|:-:|
| 24.00 hrs | 24.00 hrs | 23.50 hrs |

---

<img src="https://capsule-render.vercel.app/api?type=rect&height=45&color=gradient&customColorList=14,8,24&section=header&text=4%20%C2%B7%20Power%20BI%20Dashboard&fontSize=22&fontColor=ffffff&animation=fadeIn" width="100%" alt="Power BI Dashboard"/>

**File:** `powerbi/dashboard.pbix`

<div align="center">

<!-- Save your dashboard screenshot as outputs/powerbi_dashboard.png -->
<img src="outputs/powerbi_dashboard.png" width="100%" alt="Power BI dashboard screenshot"/>

<sub>Interactive dashboard — the channel slicer filters every KPI card and chart.</sub>

</div>

**Data model:** active one-to-many relationship `teams[team_id] → tickets[team_id]`, single-direction filtering.

**DAX measures**

```dax
Ticket Count     = COUNTROWS(tickets)

Avg Satisfaction = AVERAGE(tickets[satisfaction])

SLA Breach Rate  =
DIVIDE(
    COUNTROWS( FILTER( tickets, tickets[resolution_hours] > 24 ) ),
    COUNTROWS( tickets ),
    0
)
```

**Report page**

| Visual | Purpose |
|:--|:--|
| KPI card — Ticket Count | Clean tickets in scope |
| KPI card — Avg Satisfaction | Average customer score (1–5) |
| KPI card — SLA Breach Rate | Share of tickets over 24 hrs |
| Department comparison | Resolution time by department |
| Monthly trend | Resolution time Jan → Mar |
| Channel slicer | Filters all cards and charts |

---

<img src="https://capsule-render.vercel.app/api?type=rect&height=45&color=gradient&customColorList=12,14,18&section=header&text=Cross-Tool%20Reconciliation&fontSize=22&fontColor=ffffff&animation=fadeIn" width="100%" alt="Cross-Tool Reconciliation"/>

**Aggregate checked:** average resolution time for the **Technical** department.

| Tool | Method | Result |
|:--|:--|:-:|
| Excel | PivotTable | ✅ 28.33 hrs |
| SQL | Query S2a | ✅ 28.33 hrs |
| Python | `groupby("department")` mean | ✅ 28.33 hrs |
| Power BI | Technical filter | ✅ 28.33 hrs |

The underlying value is ≈ 28.3333 hrs; any difference is display rounding only.

---

<img src="https://capsule-render.vercel.app/api?type=rect&height=45&color=gradient&customColorList=12,14,18&section=header&text=Recommendation%20%26%20Limitation&fontSize=22&fontColor=ffffff&animation=fadeIn" width="100%" alt="Recommendation and Limitation"/>

### Recommendation

1. **Review BillingHelp and AppSupport first** — both have the highest observed breach rate (66.67%).
2. **Include Chat cases in the review** — Chat produces 3 of the 5 observed breaches.
3. **Focus on Technical** — its average resolution time is 9.00 hrs higher than Service, and it breaches the SLA on half of its tickets.

### Limitation

The dataset is synthetic and contains only 12 clean records. Each team has just 3 tickets, so a single extra ticket would shift its rate sharply. Treat these findings as a signal to investigate, not a verdict on a real support operation.

---

<img src="https://capsule-render.vercel.app/api?type=rect&height=45&color=gradient&customColorList=12,14,18&section=header&text=Repository%20%26%20Setup&fontSize=22&fontColor=ffffff&animation=fadeIn" width="100%" alt="Repository and Setup"/>

```text
data-analysis-set-e-<student-id>/
├── README.md
├── requirements.txt
├── data/raw/
│   ├── tickets.csv
│   └── teams.csv
├── excel/analysis.xlsx
├── sql/
│   ├── setup.sql
│   └── queries.sql
├── python/analysis.py
├── powerbi/dashboard.pbix
└── outputs/
    ├── clean_data.csv
    ├── python_summary.csv
    ├── python_chart.png
    ├── powerbi_dashboard.png
    └── sql/
        ├── s2a_avg_resolution_by_department.csv
        ├── s2b_teams_breaching_sla.csv
        ├── s2c_top_two_channels_by_breach_count.csv
        └── s3_data_integrity_check.csv
```

**Run the analysis**

```bash
pip install -r requirements.txt
python python/analysis.py
```

**SQL:** run `sql/setup.sql`, then `sql/queries.sql`.
**Power BI:** open `powerbi/dashboard.pbix`; if a source path is missing, point the CSV sources to `data/raw/` and refresh.

---

<img src="https://capsule-render.vercel.app/api?type=rect&height=45&color=gradient&customColorList=12,14,18&section=header&text=Submission%20Details&fontSize=22&fontColor=ffffff&animation=fadeIn" width="100%" alt="Submission Details"/>

## Video Projection
| Video (5–10 min) | https://drive.google.com/file/d/1NujxN5tamvFvj6tBT8aYMGVTMz2a5DhE/view?usp=sharing · Duration: `11 min` |
No external datasets or references were used.

---

<div align="center">

<img src="https://capsule-render.vercel.app/api?type=waving&height=140&color=gradient&customColorList=12,14,18,24&section=footer&text=Roshan%20Marathe&fontSize=34&fontColor=ffffff&animation=twinkling&fontAlignY=62&desc=Author%20%E2%80%A2%20Data%20Analysis%20Set%20A&descAlignY=82&descSize=15" width="100%" alt="Author: Roshan Marathe"/>

**Author:** Roshan Marathe · AI/ML Student
**Student ID:** `10258` · **Assigned Set:** A

*All work in this repository is my own except where cited.*

</div>
