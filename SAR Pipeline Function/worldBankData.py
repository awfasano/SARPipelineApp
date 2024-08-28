import logging
import psycopg2
from psycopg2 import sql
from indicator import Indicator  # Ensure that this import statement correctly points to your Indicator class
import worldBankAPI
import prosperityAPI

# Database connection details
DB_USER = 'awfasano'
DB_PASSWORD = 'football3'
DB_NAME = 'scorecard'
DB_HOST = '34.162.122.101'
DB_PORT = '5432'

# Function to fetch indicators from the database
def get_indicators_from_db():
    conn = None
    indicators = []
    try:
        conn = psycopg2.connect(
            user=DB_USER,
            password=DB_PASSWORD,
            host=DB_HOST,
            port=DB_PORT,
            database=DB_NAME
        )
        logging.info("Connected to the database to fetch indicators.")
        cursor = conn.cursor()

        # Fetch all relevant fields from the indicators table
        fetch_query = sql.SQL("""
        SELECT id, indicator_id, api_url, category, category_id, dataset, indicator_code, indicator_name, 
               positive_negative_indicator, number_percent, notes, afghanistan_year, bangladesh_year, 
               india_year, maldives_year, nepal_year, pakistan_year, sri_lanka_year, afghanistan_year_type, bangladesh_year_type, 
               india_year_type, maldives_year_type, nepal_year_type, pakistan_year_type, sri_lanka_year_type
        FROM indicators_revised;
        """)
        cursor.execute(fetch_query)
        rows = cursor.fetchall()

        # Map the column names to their respective index
        column_names = [desc[0] for desc in cursor.description]

        for row in rows:
            # Convert the row to a dictionary for easy access by column name
            row_dict = dict(zip(column_names, row))

            # Determine the API source based on the api_url
            api_url = row_dict['api_url']
            if 'World Bank' in api_url:
                api_source = 'World Bank API'
            elif '360' in api_url:
                api_source = '360 Prosperity API'
            else:
                api_source = 'Other API'

            # Create an Indicator object using the from_sql_row method and add it to the list
            indicator = Indicator.from_sql_row(row_dict)
            indicator.api_source = api_source  # Set the api_source manually
            indicators.append(indicator)

    except psycopg2.Error as err:
        logging.error(f"Error fetching indicators from SQL: {err}")
    finally:
        if conn:
            cursor.close()
            conn.close()

    return indicators

# Function to fetch data based on the api_source
def fetch_data_for_indicator(indicator):
    if indicator.api_source == 'World Bank API':
        return worldBankAPI.fetch_worldbank_data(indicator)
    elif indicator.api_source == '360 Prosperity API':
        return prosperityAPI.fetch_prosperity_data(indicator)
    else:
        logging.warning(f"No data fetcher available for {indicator.api_source}")
        return None

# Main function to retrieve and display indicators and their data
def main():
    indicators = get_indicators_from_db()

    # Fetch and log data for each indicator
    for indicator in indicators:
        data = fetch_data_for_indicator(indicator)
        logging.info(f"Data for {indicator.indicator_name}: {data}")

# Run the main function if this script is executed directly
if __name__ == "__main__":
    main()
