# Global-University-Rankings: A Data-Driven Analysis
Project Goal: To analyze the geographical concentration of top universities, assess the international outlook of institutions, and identify patterns in global academic excellence.

## Project Overview
This project conducts an in-depth analysis of the Times Higher Education (THE) World University Rankings 2025 dataset. The goal is to uncover key insights into the landscape of global higher education. The analysis explores the geographical distribution of top institutions, evaluates performance metrics across different domains (teaching, research, industry income), and identifies national and global leaders in academia.

The project utilizes **Python** for exploratory data analysis (EDA) and **SQL** for complex data querying, culminating in a planned **Tableau** dashboard for interactive visualization.

---

## Key Questions Explored

1.  Which countries host the highest number of top-ranked universities?
2.  What is the performance distribution of universities globally based on their overall scores?
3.  How do key performance metrics like `Teaching`, `Research`, and `Industry Income` correlate with one another?
4.  Who are the top-performing universities globally and within each country?
5.  Which institutions stand out specifically for their `Research Quality` or `Industry Income`?

---

## Tech Stack

* **Data Analysis:** Python (Pandas, Matplotlib, Seaborn)
* **Database:** PostgreSQL
* **Interactive Visualization:** Tableau
* **Environment:** Jupyter Notebook

---

## Repository Structure

```
/global-university-rankings-analysis
│
├── README.md              # Project overview and documentation
│
├── data/
│   ├── University_Rankings_Data.csv      # Raw dataset
│   └── Cleaned_University_Rankings_Data.csv # Cleaned dataset
│
├── notebooks/
│   └── Data-Analysis-using-Python.ipynb  # Detailed Python EDA
│
└── sql/
    └── SQL-Queries.sql                   # Analytical SQL queries
```
## Analysis Highlights

### Python (EDA)

`![Correlation Heatmap](path/to/your/heatmap.png)`

### SQL (Database Querying)

PostgreSQL was used to answer more targeted questions:
* **Top Performers:** Queries identified the top 10 universities globally, with **University of Oxford** ranked first.
* **Country-Level Leaders:** Using window functions, the top 5 universities within each country were identified, revealing national academic leaders.
* **Elite University Concentration:** The analysis of the Top 100 universities shows that the **United States** has the largest share (36 universities), followed by the **United Kingdom** (11).

---

## Tableau Visualization

An interactive dashboard is being developed in Tableau to bring this data to life. The dashboard will allow users to dynamically filter and explore the rankings.

**Features will include:**
* An interactive world map showing university locations and ranks.
* A country-level performance dashboard to compare national strengths.
* A scatter plot to explore the relationship between `Research Score` and `Industry Income`.
* A dynamic table to search for and view details of any university.

**[➡️ Link to Tableau Public Dashboard (Coming Soon)]()**

---

## Author

* **Fatema Doctor**
* [linkedin.com/in/doctor-fatema](https://www.linkedin.com/doctor-fatema)
* [github.com/Fatema-Dr](https://github.com/Fatema-Dr)
