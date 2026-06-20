# Supply-Constrained Demand Forecasting Engine

End-to-end forecasting and operational analytics project simulating a global FMCG supply chain operating under seasonal demand spikes, constrained capacity, and inventory limitations.

## Project Overview

This project demonstrates a complete analytics workflow:

- Data modeling and transformation in SQL Server
- Exploratory Data Analysis (EDA) in Python
- Statistical forecasting
- Machine Learning forecasting
- Forecast accuracy benchmarking
- Business-focused recommendations

The objective was to determine which forecasting approach best captures demand behavior in a multi-category, multi-region consumer goods business and to understand the operational implications of forecast performance.

## Tech Stack

- SQL Server
- Python
- pandas
- NumPy
- matplotlib
- seaborn
- statsmodels
- scikit-learn
- XGBoost
- Jupyter Notebook

## Project Structure

```text
├── data/
│   ├── raw/
│   └── processed/
├── notebooks/
│   ├── 01_exploratory_forecasting_analysis.ipynb
│   ├── 02_forecasting_model_comparison.ipynb
│   └── 03_machine_learning_forecasting.ipynb
├── README.md
├── requirements.txt
└── .gitignore
```

## SQL Layer

The SQL layer was used to:

- Design the relational data model
- Build fact and dimension tables
- Create forecasting-ready analytical views
- Calculate forecast accuracy metrics
- Generate executive KPI datasets

Key outputs:

- `vw_forecasting_base`
- `vw_forecast_accuracy`
- `vw_executive_kpis`

## Exploratory Analysis

The EDA identified several important business patterns:

- Strong annual seasonality with recurring Q4 demand spikes
- Consistent long-term demand growth
- Fragrance as the highest-volume and most volatile category
- Skincare as a high-volume but relatively stable category
- Forecast accuracy deterioration as forecast horizon increases
- Persistent service-level degradation during Q4 peak periods

Time-series decomposition showed that most demand variation is explained by trend and seasonality, suggesting high forecastability.

## Forecasting Models Evaluated

### Baseline Models

- Naive Forecast
- Seasonal Naive Forecast
- Trend-Adjusted Seasonal Naive Forecast

### Statistical Models

- Holt-Winters Exponential Smoothing

### Machine Learning Models

- Random Forest Regressor
- XGBoost Regressor

## Model Performance

| Model | MAPE |
|---------|---------:|
| Naive Forecast | 58.97% |
| Seasonal Naive Forecast | 11.55% |
| XGBoost | 11.58% |
| Random Forest | 12.71% |
| Trend-Adjusted Seasonal Naive | 2.03% |
| Holt-Winters Exponential Smoothing | **1.39%** |

## Key Findings

- Demand is primarily driven by trend and seasonality.
- Forecast accuracy declines as forecast horizon increases.
- Service levels consistently deteriorate during Q4 peak periods.
- Machine learning models did not outperform statistical forecasting methods.
- Holt-Winters achieved the best overall forecasting performance.
- Simpler, interpretable models proved more effective than more complex machine learning approaches for this demand pattern.

## Machine Learning Insights

Feature importance analysis revealed:

- Lag 12 was the strongest predictor across both Random Forest and XGBoost.
- Seasonality was the dominant signal in the dataset.
- Initial model results revealed target leakage, which was identified and corrected before final evaluation.
- Correcting leakage significantly improved the validity of model benchmarking.

## Business Recommendation

For this business context, Holt-Winters Exponential Smoothing is the recommended forecasting approach due to its superior accuracy, interpretability, and ability to directly model trend and seasonality.

The results suggest that increasing model complexity does not necessarily improve forecast performance when demand behavior is highly structured and predictable.

## Author

**Ignacio Spreafico**
Senior Data Analyst | Product Analytics | Experimentation & Decision Science

📧 Email: nachospreafico06@gmail.com
🔗 LinkedIn: https://www.linkedin.com/in/ignacio-spreafico
📊 Portfolio: https://ignaciospreafico.vercel.app
🐙 GitHub: https://github.com/nachospreafico
