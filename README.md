# Global University Rankings — Cross-System Analysis

> **What actually separates a top-20 university from a top-100 one?**
> This project compares three major global ranking systems (QS, Times Higher Education, CWUR), finds where they agree and disagree, and builds a predictive model to identify the metrics that matter most.

---

## Project overview

University rankings are taken seriously by students, governments, and employers — but how much do different ranking bodies actually agree? This analysis digs into three independent datasets to answer:

- Which countries and institutions consistently dominate across all three systems?
- Which ranking metrics (research, citations, teaching, employer reputation) drive overall scores?
- Where do QS and THE disagree — and why?
- Can we predict a university's tier from its component scores alone?

---

## Key findings

| Finding | Detail |
|---|---|
| **US/UK dominance** | The top 20 in all three systems is overwhelmingly US and UK institutions |
| **Citation impact is the strongest predictor** | Correlation > 0.85 with overall rank across all three datasets |
| **QS vs THE disagreement** | QS weights employer reputation more heavily; this benefits US business schools over European research institutions |
| **CWUR is the most research-skewed** | Publication count and faculty quality dominate; teaching quality has minimal weight |
| **Regional outliers** | Singapore (NUS) and China (Tsinghua, Peking) outperform their regional peers by 40+ rank positions in citation-weighted systems |

---

## Methodology

```
1. Data cleaning     — handling missing scores, normalising country names, merging on institution name
2. EDA               — distribution plots, correlation matrices, country-level breakdowns
3. Cross-system comparison — rank correlation (Spearman) between QS, THE, CWUR for shared institutions
4. Feature importance — Random Forest to rank which metrics best predict overall score
5. Visualisation     — interactive Plotly charts: scatter, heatmap, choropleth world map
```

---

## Repository structure

```
Global-University-Rankings/
│
├── data/
│   ├── raw/                    # Original Kaggle CSV files (not redistributed — see below)
│   └── processed/              # Cleaned, merged dataset
│
├── notebooks/
│   ├── 01_data_cleaning.ipynb
│   ├── 02_exploratory_analysis.ipynb
│   ├── 03_cross_system_comparison.ipynb
│   └── 04_predictive_modelling.ipynb
│
├── outputs/
│   ├── figures/                # All exported charts
│   └── summary_findings.md
│
├── requirements.txt
└── README.md
```

---

## Data sources

Data comes from Kaggle's [World University Rankings dataset](https://www.kaggle.com/datasets/mylesoneill/world-university-rankings), which includes:

- **Times Higher Education (THE)** — 2011–2016, scored on teaching, research, citations, industry income, international outlook
- **CWUR (Center for World University Rankings)** — 2012–2015, scored on education quality, alumni employment, faculty quality, publications, citations, patents
- **QS Rankings** — supplementary scoring on academic reputation, employer reputation, faculty-to-student ratio, international diversity

To reproduce this project, download the dataset from Kaggle and place the CSVs in `data/raw/`.

---

## Setup

```bash
git clone https://github.com/Fatema-Dr/Global-University-Rankings.git
cd Global-University-Rankings
pip install -r requirements.txt
jupyter notebook notebooks/01_data_cleaning.ipynb
```

**Requirements:** Python 3.9+, Pandas, NumPy, Scikit-learn, Plotly, Seaborn, Matplotlib, Jupyter

---

## Skills demonstrated

`Exploratory data analysis` · `Multi-dataset merging and cleaning` · `Statistical correlation analysis` · `Spearman rank correlation` · `Random Forest feature importance` · `Plotly interactive visualisation` · `Geospatial choropleth mapping` · `Insight communication`

---

## About

Built as part of a personal data analytics portfolio. Motivated by the question of whether global university rankings are measuring the same thing or telling completely different stories — and what that means for students and policymakers who rely on them.

*Fatema Doctor · BSc Data Science & AI · University of East London*
*[LinkedIn](https://linkedin.com/in/doctor-fatema) · [GitHub](https://github.com/Fatema-Dr)*
