# Walmart_Data_Analysis

**Project Overview:**

![dashboard](https://github.com/user-attachments/assets/d04036d9-982a-422c-b59a-8c85960fc300)

This project is an end-to-end data analysis solution designed to extract critical business insights from Walmart sales data. We utilize Python for data processing and analysis, SQL for advanced querying structured problem-solving techniques to solve key business questions and power bi for dashboard creation. The project is ideal for data analysts looking to develop skills in data manipulation, SQL querying, and data pipeline creation.

## Project Steps

### 1. Set Up the Environment
   - **Tools Used**: Python, MY SQL
   - **Goal**: Create a structured workspace within python and organize project folders for smooth development and data handling.

### 2. Set Up Kaggle API
   - **API Setup**: Obtain your Kaggle API token from [Kaggle](https://www.kaggle.com/) by navigating to your profile settings and downloading the JSON file.

### 3. Download Walmart Sales Data
   - **Data Source**: Use the Kaggle API to download the Walmart sales datasets from Kaggle.
   - **Dataset Link**: [Walmart Sales Dataset](https://www.kaggle.com/najir0123/walmart-10k-sales-datasets)

### 4. Install Required Libraries and Load Data
   - **Libraries**: Install necessary Python libraries using:
     ```bash
     pip install pandas pymysql sqlalchemy 
     ```
   - **Loading Data**: Read the data into a Pandas DataFrame for initial analysis and transformations.

### 5. Explore the Data
   - **Goal**: Conduct an initial data exploration to understand data distribution, check column names, types, and identify potential issues.
   - **Analysis**: Use functions like `.info()`, `.describe()`, and `.head()` to get a quick overview of the data structure and statistics.

### 6. Data Cleaning
   - **Remove Duplicates**: Identify and remove duplicate entries to avoid skewed results.
   - **Handle Missing Values**: Drop rows or columns with missing values if they are insignificant; fill values where essential.
   - **Fix Data Types**: Ensure all columns have consistent data types (e.g., dates as `datetime`, prices as `float`).
   - **Currency Formatting**: Use `.replace()` to handle and format currency values for analysis.
   - **Validation**: Check for any remaining inconsistencies and verify the cleaned data.

### 7. Feature Engineering
   - **Create New Columns**: Calculate the `Total Amount` for each transaction by multiplying `unit_price` by `quantity` and adding this as a new column.
   - **Enhance Dataset**: Adding this calculated field will streamline further SQL analysis and aggregation tasks.

### 8. Load Data into MySQL
   - **Set Up Connections**: Connect to MySQL using `sqlalchemy` and load the cleaned data into each database.
   - **Table Creation**: Set up tables in MySQL using Python SQLAlchemy to automate table creation and data insertion.
   - **Verification**: Run initial SQL queries to confirm that the data has been loaded accurately.

### 9. SQL Analysis: Complex Queries and Business Problem Solving
   - **Business Problem-Solving**: Write and execute complex SQL queries to answer critical business questions, such as:
     - Revenue trends across branches and categories.
     - Identifying best-selling product categories.
     - Sales performance by time, city, and payment method.
     - Analyzing peak sales periods and customer buying patterns.
     - Profit margin analysis by branch and category.
       
### 10.Power BI:I connected an SQL database to Power BI and developed a professional, data-driven dashboard to deliver actionable insights."

The Walmart Sales Analysis Dashboard provides the following insights:

Total Revenue is approximately 1.21 million, with Total Profit at 0.48 million, indicating a healthy profit margin.

Total Quantity sold is around 23.48K across 9,969 transactions, with an average rating of 5.83.

Fashion Accessories and Home & Lifestyle contribute the largest shares of total revenue, each around 40%.

Cash is the most popular payment method, accounting for about 40.41% of sales.

Weslaco and Waxahachie cities lead in both revenue and profit.

Sales peak during specific hours of the day, notably around midday, which can inform staffing and marketing strategies.
