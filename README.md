# 💊 Clinical Trial Data Processing (SAS)

## 📌 Project Overview
This repository contains a structured **SAS programming pipeline** designed for processing and analyzing randomized clinical trial data. The study evaluates the survival outcomes and drug compliance of **6 lung cancer patients** treated with either **Drug A** or **Drug B**.

The project demonstrates fundamental biostatistical programming techniques, including **data step creation, SAS date calculations, per-protocol cohort filtering, dynamic scheduling using DO loops, and relational dataset merging**.

---

## 🛠️ Technical Capabilities & SAS Features Demonstrated
* **Data Step & Cards Statement**: Raw clinical dataset creation with custom variable labeling and informat handling (`MMDDYY10.`, `DATE9.`).
* **Feature Engineering & SAS Date Functions**:
  * Combined Subject ID creation (`tsubjid`).
  * Baseline age derivation from birthday and recruitment date (`INT` and exact year conversion).
  * Survival length derivation in weeks, rounded to 1 decimal place (`ROUND`).
* **Per-Protocol Cohort Logic (`anafl` & `monitorc`)**:
  * Conditional flagging for per-protocol adherence (Compliance $\ge$ 85%).
  * Target cohort identification for clinical monitoring based on survival thresholds (< 34 weeks).
* **Automated Schedule Generation**: Utilizing iterative `DO` loops to project 3-visit schedules (14-day intervals) across study participants.
* **Relational Merging**: Merging schedule data (`visitsch`) with patient analytical data (`anadat`) on key variable `tsubjid`.

---

## 📂 Repository Structure
```text
├── SAS_assignment.sas   # Main SAS script containing Data Steps, PROC PRINT, & Merging
└── README.md                      # Documentation and technical summary
