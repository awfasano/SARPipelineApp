import requests
import helpers
from collections import defaultdict

def fetch_prosperity_data(indicator):
    """Fetch data from the 360 Prosperity API based on the indicator and years for specified countries."""
    base_url = indicator.api_url
    datasetid = indicator.dataset
    indicator_ids = [indicator.indicator_code]

    # Group countries by year to avoid duplicates
    year_country_map = defaultdict(list)

    for country_id, year in indicator.country_year_map.items():
        iso3_code = helpers.country_iso3_map.get(country_id)  # Use ISO3 code for the URL
        if iso3_code:
            year_country_map[year].append(iso3_code)
            
    if not year_country_map:
        print("No valid country codes with matching years provided.")
        return None

    # Construct the URL with datasetid, indicatorIds, countryCodes, and years
    country_codes = []
    years = []

    for year, countries in year_country_map.items():
        country_codes.extend(countries)
        years.extend([year] * len(countries))  # Duplicate the year for each country

    year_range = f"{min(years)}:{max(years)}"  # Format the year range as "min_year:max_year"
    url = f"{base_url}?datasetid={datasetid}&indicatorIds={','.join(indicator_ids)}&countryCodes={','.join(country_codes)}&years={year_range}"
    print(url)

    print(f"Fetching data from URL: {url}")  # Debugging line to print the URL

    try:
        response = requests.get(url)
        response.raise_for_status()
        data = response.json()
        print(data)
        parse_data(data["value"], indicator)
    except requests.exceptions.RequestException as e:
        print(f"An error occurred while fetching data from 360 Prosperity API: {e}")
        return None

def parse_data(data, indicator):
    indicator_values = []  # Initialize an empty list to store IndicatorValue objects

    # Map numeric country codes to country names

    for item in data:
        # Extracting values from the data point
        value = item.get('IND_VALUE')  # The actual value of the indicator
        iso3_code = item.get('COUNTRY_CODE')  # The country code in ISO3 format
        country_id = helpers.country_id_map.get(iso3_code)  # Convert ISO3 code to numeric country ID
        country = helpers.country_name_map.get(country_id)  # Map country ID to the country name
        cal_year = item.get('CAL_YEAR')  # The year, here it's a string like '01/01/2020'
        year_type = cal_year.split('/')[-1]  # Extract the year from 'CAL_YEAR'

        # Check if the year from the data matches the expected year from the Indicator object
        expected_year = indicator.country_year_map.get(country_id)
        if str(expected_year) != year_type:
            print(f"Skipping {country} because of year mismatch: {year_type} != {expected_year}")
            continue

        # Increment the counts for the year and year_type
        indicator.increment_counts(country_id, expected_year)

        # Standardized value and table standardized value can be set here if needed
        standardized_value = None  # Assuming standardized_value needs to be calculated or is not provided
        table_standardized_value = None  # Assuming table_standardized_value needs to be calculated or is not provided

        # Create an IndicatorValue object only if the year matches
        indicator_value = IndicatorValue(
            indicator=indicator,
            value=value,
            country=country,
            standardized_value=standardized_value,
            table_standardized_value=table_standardized_value
        )

        # Append the IndicatorValue object to the list
        indicator_values.append(indicator_value)

    return indicator_values  # Return the list of IndicatorValue objects