# NYC Taxi Data Analysis & Shiny Dashboard

## Overview

This project focuses on building an interactive Shiny web application using the NYC Yellow Taxi Trip Record Data for the year 2024. The aim is to analyze taxi trip patterns across New York City, uncover key insights about passenger behavior, fares, and traffic patterns, and present the results through a visually engaging and interactive dashboard.

The data is sourced from the NYC Taxi and Limousine Commission (TLC), which publishes trip records on a monthly basis. We collected, cleaned, and transformed this data to prepare it for analysis and visualization.

---

## Project Goals

- Understand and explore the structure of NYC taxi trips across different time scales (hourly, daily, monthly)
- Analyze patterns in trip distance, fare amount, tip behavior, and passenger counts
- Investigate trip duration and detect outliers or anomalies
- Build a clean, interactive Shiny dashboard that allows users to:
  - Filter by date, time, boroughs, payment type, and more
  - View summary statistics and dynamic plots
  - Explore geospatial trends based on pickup and drop-off locations

---

## Dataset

- **Source**: NYC TLC Trip Record Data  
- **Year**: 2024  
- **Format**: Monthly `.parquet` files (1 file per month)  
- **Final Format**: Combined into a single `.csv` file with over 41 million rows and 19 variables

---

## Key Variables

- `tpep_pickup_datetime`, `tpep_dropoff_datetime`
- `passenger_count`, `trip_distance`
- `RatecodeID`, `store_and_fwd_flag`
- `PULocationID`, `DOLocationID`
- `payment_type`, `fare_amount`, `tip_amount`, `total_amount`
- `congestion_surcharge`, `Airport_fee`, `mta_tax`, `tolls_amount`

---

## Data Preparation Process

1. **File Merging**  
   - All 12 monthly `.parquet` files were read and merged into one CSV file.
   - A memory-efficient script was used to process and delete each file after reading to avoid system overload.

2. **Initial Exploration**  
   - Structural and summary analysis using `str()`, `summary()`, and `colSums(is.na())`  
   - Identified missing values and extreme outliers in fare and distance columns

3. **Missing Value Handling**  
   - Five variables had identical missing values across ~4 million rows
   - These rows were removed to ensure a clean, complete dataset

4. **Datetime Conversion**  
   - Pickup and drop-off timestamps were converted to datetime format
   - Invalid timestamp rows (55 in total) were removed

5. **Feature Engineering**  
   - Extracted time-based features from both pickup and drop-off timestamps:
     - Hour of day, day of week, month, and trip duration in minutes

6. **Outlier Filtering**  
   - Applied logical caps on trip distance, fare amount, total amount, tip amount, and tolls
   - Filtered out trips with 0 duration or durations over 3 hours

---

## Technologies Used

- **Language**: R
- **Libraries**: `tidyverse`, `lubridate`, `arrow`, `dplyr`, `ggplot2`, `shiny`, `plotly`
- **Output**: Interactive Shiny Web Application (to be built)

---

## Upcoming Work

- Building modular and interactive Shiny components
- Designing the UI to include filters, visual panels, and map-based insights
- Generating summary statistics and dynamic charts (bar plots, heatmaps, line charts, boxplots)
- Deploying the app to a publicly accessible platform (e.g., shinyapps.io or university server)

---

## Team Contributions

This project is a group effort. Each member will be involved in data wrangling, exploratory analysis, visualization design, app development, and presentation. Roles and responsibilities will be divided collaboratively as we move into the dashboard-building phase.

---

## Future Enhancements

- Add geospatial visualization of pickup and drop-off zones
- Incorporate clustering to detect taxi hotspots
- Build predictive models (e.g., fare estimation or trip duration prediction)
- Enable live filtering for dates, boroughs, and ride types

---

## Acknowledgments

We acknowledge the NYC Taxi and Limousine Commission for making this valuable dataset publicly available and enabling rich data analysis and visualization projects.

---
