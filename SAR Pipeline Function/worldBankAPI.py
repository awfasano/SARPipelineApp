import requests
from collections import defaultdict
import helpers
import indicator
import indicatorVal

# Assume Indicator and IndicatorValue classes remain the same as provided

def fetch_worldbank_data(indicator):
    """Fetch data from the World Bank API for specific countries based on the indicator and year."""
    base_url = "https://api.worldbank.org/v2/country/{countries}/indicator/{indicator}"
    format_type = "json"
    

    # List of countries from the indicator's country_year_map
    countries = list(indicator.country_year_map.keys())

    # Find the minimum and maximum year
    years = list(indicator.country_year_map.values())
    min_year = min(years)
    max_year = max(years)

    # Format the year range as "min_year:max_year"
    year_range = f"{min_year}:{max_year}"

    # Construct the countries string for the URL
    countries_str = ";".join(countries)

    # Construct the URL with the selected countries, indicator, year range, and format
    url = f"{base_url.format(countries=countries_str, indicator=indicator.indicator_code)}?date={year_range}&format={format_type}&per_page=250"
    
    print(f"Fetching data from URL: {url}")  # Debugging line to print the URL

    try:
        response = requests.get(url)
        response.raise_for_status()
        data = response.json()
        print(data)  # Print the raw data for debugging
        return parse_worldbank_data(data, indicator)
    except requests.exceptions.RequestException as e:
        print(f"An error occurred while fetching data from the World Bank API: {e}")
        return None

def parse_worldbank_data(data, indicator):
    indicator_values = []  # Initialize an empty list to store IndicatorValue objects

    if data and len(data) > 1:
        for item in data[1]:  # Data is nested within the second element of the list
            value = item.get('value')  # The actual value of the indicator
            year = item.get('date')  # The year
            iso3_code = item.get('countryiso3code')  # The country code in ISO3 format
            
            # Map ISO3 country code to numeric country ID (optional, based on your existing map)
            country_id = helpers.country_id_map.get(iso3_code, None)
            country_name = helpers.country_iso3_map.get(country_id, iso3_code)  # Map to country name, fallback to ISO3 code
            
            # Increment the counts for the year and year_type if available
            #if country_id is not None:
            #    indicator.increment_counts(country_id, year)
            
            # Standardized value and table standardized value can be set here if needed
            standardized_value = None  # Assuming standardized_value needs to be calculated or is not provided
            table_standardized_value = None  # Assuming table_standardized_value needs to be calculated or is not provided
            
            # Create an IndicatorValue object
            indicator_value = indicatorVal.IndicatorValue(
                indicator=indicator,
                value=value,
                country=country_name,
                standardized_value=standardized_value,
                table_standardized_value=table_standardized_value
            )
            
            # Append the IndicatorValue object to the list
            indicator_values.append(indicator_value)
    
    return indicator_values  # Return the list of IndicatorValue objects
