# Corporate Credit Rating Analysis

An end-to-end data analytics project that analyzes corporate credit ratings (AAA to D) using company financial ratios, built with **SQL**, **Excel**, and **Power BI**.

## Project Overview

Credit ratings help banks, lenders, and investors decide whether a company is financially healthy enough to be given a loan or investment. This project explores a dataset of 2,000+ corporate credit ratings issued by agencies like S&P, Moody's, Fitch, and Egan-Jones, along with each company's financial ratios (liquidity, profitability, leverage, and cash flow), to understand **what drives a company's credit rating**.

**Core question:** Which financial factors (debt levels, profitability, cash flow, liquidity) most influence whether a company gets a strong (Investment Grade) or weak (Speculative Grade / Default) credit rating?

## Motive

Just like a **CIBIL score** tells a bank whether an individual is trustworthy enough for a loan, a **corporate credit rating** tells lenders and investors whether a *company* is financially strong enough to repay debt. This project reverse-engineers that relationship, using real financial ratios to explain and visualize why some companies are rated safe (AAA/AA) and others are rated risky (BB/B/CCC) or already in default (D).

## Tech Stack / Pipeline

Pipeline stages, in order:
1. Raw Data (Excel)
2. SQL (Data Cleaning and EDA)
3. Excel (Scoring Logic)
4. Power BI (Dashboard)

| Stage | Tool | Purpose |
|---|---|---|
| 1. Data Storage | Excel (`Data` sheet) | Raw dataset of companies, ratings, and financial ratios |
| 2. Data Cleaning & EDA | MySQL | Null checks, duplicate checks, distribution analysis, sector/year trends |
| 3. Scoring Logic | Excel (`RatingLookup` sheet) | Maps each rating to a numeric score and category using `INDEX`/`MATCH` |
| 4. Visualization | Power BI | 3-page interactive dashboard with KPI cards, trend and comparison charts |

## Repository Structure

Corporate-Rating-Analysis/
- data/
  - Corporate_Rating.xlsx (Raw dataset, RatingLookup, and DAX measures reference)
- sql/
  - Finance_Project_Queries.sql (Data cleaning and exploratory analysis queries)
- powerbi/
  - Pbi_Report.pbix (Interactive 3-page Power BI dashboard)
- README.md (Project documentation, this file)
- LICENSE (optional, open-source license)

## Dataset Description

The dataset contains **2,029 corporate credit rating records** with the following key columns:

| Category | Columns |
|---|---|
| Identifiers | `Name`, `Symbol`, `Sector`, `Rating Agency Name`, `Date` |
| Rating | `Rating`, `Rating Score` (10 for AAA down to 1 for D), `Rating Category` (Investment Grade, Speculative Grade, or Default) |
| Liquidity | `currentRatio`, `quickRatio`, `cashRatio` |
| Profitability | `netProfitMargin`, `returnOnEquity`, `returnOnAssets`, `grossProfitMargin` |
| Leverage | `debtRatio`, `debtEquityRatio`, `companyEquityMultiplier` |
| Cash Flow | `freeCashFlowPerShare`, `operatingCashFlowPerShare`, `operatingCashFlowSalesRatio` |
| Time | `Date Parsed`, `Year`, `Quarter` |

### Rating Categories

| Category | Ratings Included | Meaning |
|---|---|---|
| **Investment Grade** | AAA, AA, A, BBB | Financially strong, low default risk |
| **Speculative Grade** | BB, B, CCC, CC, C | Higher risk, often called "junk bonds" |
| **Default** | D | Company has already defaulted on obligations |

## SQL Analysis (`Finance_Project_Queries.sql`)

The SQL file performs:
- Data quality checks (nulls, duplicates, unique records)
- Rating distribution (count and percentage per rating)
- Average financial ratios grouped by rating
- Sector-wise and Year/Quarter-wise rating breakdown
- Top 10 companies ranked by Rating Score

## Power BI Dashboard (`Pbi_Report.pbix`)

A 3-page interactive report:

- Page 1, Overview: KPI cards, rating distribution, rating category donut chart, average rating score by sector, year-wise rating trend
- Page 2, Profitability and Leverage: Net profit margin, debt-equity ratio by rating category, return on equity, cash ratio, rating category breakdown
- Page 3, Deep Dive: Current ratio, ROE vs ROA comparison, free cash flow ratio, sector-wise distribution

## Known Data Quality Note

Three records for **YRC Worldwide, Inc.** show extreme `returnOnEquity` values (>10,000%) caused by near-zero shareholders' equity, which distorts the average ROE for the Speculative Grade category. These are treated as outliers and excluded from average calculations (see `Avg ROE (Clean)` DAX measure) rather than deleted from the raw dataset, to preserve data transparency.

## Key Insight

Average Return on Equity decreases as credit rating worsens:
- Investment Grade: approximately 19 percent
- Speculative Grade: approximately 6 percent
- Default: approximately -50 percent

This confirms that stronger financial performance correlates with better credit ratings, which validates the real-world purpose of credit ratings: helping lenders assess repayment risk before extending credit.

## How to Use

1. Clone this repository
2. Open `data/Corporate_Rating.xlsx` to explore the raw dataset and scoring logic
3. Run the queries in `sql/Finance_Project_Queries.sql` against a MySQL instance (create the `Corporate_Rating` database first)
4. Open `powerbi/Pbi_Report.pbix` in Power BI Desktop to explore the interactive dashboard

## License

This project is for educational/portfolio purposes. Add a license (e.g., MIT) if you'd like others to reuse it.

---

*Built as a data analytics portfolio project demonstrating SQL, Excel, and Power BI skills through a real-world financial risk use case.*
