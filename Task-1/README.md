###Netflix Data Cleaning – Task 1

Data Analyst Internship

**Objective**

To clean and preprocess the Netflix dataset by handling missing values, checking duplicates, and preparing the data for further analysis.

**Dataset Used**

Netflix Movies and TV Shows Dataset (netflix_titles.csv)

Total Records: 8807

Total Columns: 12

**Data Cleaning Steps Performed**

1️)Initial Exploration

Used df.head(), df.info(), and df.isnull().sum()

Identified missing values in director, cast, country, date_added, rating, and duration

2️)Handling Missing Values

Director & Cast → Filled with "Not Available"

Country → Filled with "Unknown"

Rating → Filled using Mode (most frequent value)

Duration → Filled with "Unknown" to maintain dataset consistency

Date Added → Cleaned and converted to datetime format

3️)Duplicate Check

Checked using df.duplicated().sum()

No duplicate rows found

4️)Standardization

Renamed columns to lowercase and removed spaces

Removed extra spaces from text columns

*Final Output*

Cleaned dataset saved as netflix_cleaned.csv

Dataset contains no missing values

Ready for further analysis or visualization

*Tools Used*

Python

Pandas

Jupyter Notebook
