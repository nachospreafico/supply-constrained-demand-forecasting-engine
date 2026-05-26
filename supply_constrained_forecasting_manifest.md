# Supply-Constrained Demand Forecasting & Allocation Engine

## Portfolio Manifest / Source of Truth

### By Ignacio Spreafico

---

# 1. Vision

Build a senior-level analytics project that simulates how a global company forecasts demand under uncertainty and makes allocation decisions when supply cannot fulfill all market demand.

This is not simply a forecasting project.

This is a:

- decision-support system
- operational analytics platform
- forecasting and allocation engine
- business simulation
- executive decision-making tool

The project must feel:

- realistic
- operational
- business-critical
- technically robust
- analytically mature
- executive-facing

---

# 2. Core Narrative

> “When supply cannot fulfill global demand, how should a business allocate constrained inventory across markets while minimizing risk and maximizing strategic outcomes?”

The project must demonstrate the ability to:

- forecast future demand
- quantify uncertainty
- evaluate operational risk
- support business prioritization
- communicate tradeoffs clearly
- recommend actionable decisions

---

# 3. Strategic Portfolio Objective

This project exists to position Ignacio as:

- Senior Data Analyst
- Product/Data Analytics professional
- Decision Science candidate
- Forecasting & Operations Analytics specialist
- Business-oriented Data Scientist

The project should showcase:

- SQL
- Python
- forecasting
- statistics
- business reasoning
- stakeholder thinking
- Power BI
- analytical storytelling

---

# 4. Business Scenario

A fictional global consumer goods company launches seasonal campaigns across multiple regions.

Demand forecasts exceed available supply.

The company must:

- forecast demand accurately
- understand risk exposure
- allocate constrained inventory strategically
- minimize lost revenue
- protect strategic markets
- reduce overstock and stockout risk

The analytics team is tasked with building a centralized decision-support platform.

---

# 5. Project Pillars

## Pillar 1 — Forecasting

Forecast future demand by:

- market
- product
- campaign
- month

## Pillar 2 — Supply Constraints

Simulate limited:

- production
- inventory
- logistics capacity

Demand cannot always be fulfilled.

## Pillar 3 — Allocation Logic

Develop prioritization rules to determine:

- who gets inventory
- when
- how much

while balancing business goals.

## Pillar 4 — Executive Decision Support

Translate analytics into:

- recommendations
- operational actions
- business insights
- risk communication

---

# 6. Technical Architecture

## SQL Layer

Purpose:

- storage
- transformations
- analytical modeling

Possible stack:

- PostgreSQL
- SQL Server
- BigQuery

## Python Layer

Purpose:

- forecasting
- simulations
- optimization logic
- statistical evaluation

Libraries:

- pandas
- numpy
- scikit-learn
- Prophet
- XGBoost / LightGBM
- matplotlib

## BI Layer

Purpose:

- executive dashboards
- operational monitoring
- scenario analysis

Tool:

- Power BI

---

# 7. Suggested Data Model

## Fact Tables

### demand_history

Historical demand by:

- product
- market
- month

### shipments

Actual fulfilled shipments.

### inventory

Inventory snapshots.

### supply_capacity

Available supply by period.

### forecast_output

Forecast results.

### allocation_results

Final allocation recommendations.

## Dimension Tables

### dim_product

- category
- brand
- margin
- lifecycle

### dim_market

- region
- strategic_priority
- lead_time
- channel

### dim_calendar

- month
- quarter
- seasonality
- campaign period

---

# 8. Forecasting Strategy

## Baseline Models

Implement:

- naive forecast
- moving average
- exponential smoothing

Purpose:

Establish benchmarking discipline.

## Advanced Models

Potential models:

- Prophet
- XGBoost
- LightGBM

## Evaluation Metrics

Track:

- MAPE
- RMSE
- forecast bias
- weighted error

---

# 9. Allocation Engine

## Core Question

When demand exceeds supply, how should inventory be distributed?

## Possible Business Rules

### Strategic Market Protection

Prioritize high-value markets.

### Lead Time Protection

Protect distant markets requiring earlier shipments.

### Revenue Prioritization

Favor higher-margin products or markets.

### Inventory Risk Reduction

Reduce future excess stock exposure.

## Example Scoring Logic

```python
allocation_score = (
    strategic_market_weight +
    lead_time_weight +
    revenue_weight +
    forecast_gap_weight
)
```

The allocation engine should feel:

- explainable
- business-oriented
- transparent
- realistic

---

# 10. Dashboard Vision

The dashboard must look executive-ready.

Not academic.

Not “Kaggle-style.”

## Core Sections

### Executive Summary

- forecasted demand
- constrained supply
- expected fulfillment %
- revenue at risk

### Forecast Accuracy

- actual vs forecast
- error trends
- bias monitoring

### Supply Risk Monitoring

- markets at risk
- stockout exposure
- inventory constraints

### Allocation Recommendations

- proposed reallocations
- protected markets
- expected business impact

### Scenario Analysis

“What happens if supply decreases another 10%?”

---

# 11. Business Questions the Project Must Answer

The project should answer questions such as:

- Which markets are most at risk?
- How much revenue is exposed?
- Which products should be prioritized?
- What is the expected service level?
- How accurate are forecasts?
- Which regions require inventory protection?
- What operational actions should leadership take?

---

# 12. Portfolio Positioning

This project should communicate:

> “I do not only analyze historical data.  
> I build systems that support future operational decisions under uncertainty.”

That is the core positioning.

---

# 13. Deliverables

## Technical Deliverables

- SQL schema
- Python forecasting pipeline
- allocation engine
- Power BI dashboard
- data dictionary
- README
- executive presentation

## Portfolio Deliverables

- GitHub repository
- polished screenshots
- architecture diagram
- LinkedIn showcase post
- business case presentation

---

# 14. Quality Standards

The project must prioritize:

- readability
- modularity
- realism
- business relevance
- clean architecture
- reproducibility
- executive communication

Avoid:

- unnecessary complexity
- overengineering
- academic-only framing
- ML for the sake of ML

---

# 15. Success Criteria

The project is successful if a recruiter/interviewer thinks:

> “This feels like a real internal analytics initiative at a mature company.”

and:

> “This candidate understands both analytics and business operations.”

---

# 16. Guiding Philosophy

This is not a “toy portfolio project.”

This is a simulation of how analytics supports operational decision-making in real organizations.

The objective is not merely to predict demand.

The objective is to support better business decisions under uncertainty.
