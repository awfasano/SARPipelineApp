from collections import defaultdict

class Indicator:
    def __init__(self, id, indicator_id, api_url, category, category_id, dataset, indicator_code,
                 indicator_name, positive_negative_indicator, number_percent, notes, country_year_map,
                 country_year_type_map, api_source=None):
        self.id = id
        self.indicator_id = indicator_id
        self.api_url = api_url
        self.category = category
        self.category_id = category_id
        self.dataset = dataset
        self.indicator_code = indicator_code
        self.indicator_name = indicator_name
        self.positive_negative_indicator = positive_negative_indicator
        self.number_percent = number_percent
        self.notes = notes
        self.country_year_map = country_year_map  # Map of countryID (ISO3 numeric code) to year
        self.country_year_type_map = country_year_type_map  # Map of countryID to year type (1, 2, 3)
        self.year_counts = defaultdict(int)  # Counts occurrences of each year
        self.year_type_counts = defaultdict(int)  # Counts occurrences of each year_type
        self.api_source = api_source  # This field is set based on the API URL

    def __repr__(self):
        return (f"Indicator(id={self.id}, indicator_id={self.indicator_id}, url={self.api_url}, "
                f"category={self.category}, category_id={self.category_id}, dataset={self.dataset}, "
                f"indicator_code={self.indicator_code}, name={self.indicator_name}, "
                f"api_source={self.api_source}, year_counts={dict(self.year_counts)}, "
                f"year_type_counts={dict(self.year_type_counts)})")

    @classmethod
    def from_sql_row(cls, row):
        # Extract country_year_map and country_year_type_map
        country_year_map = {
            "AFG": row['afghanistan_year'],
            "BGD": row['bangladesh_year'],
            "IND": row['india_year'],
            "MDV": row['maldives_year'],
            "NPL": row['nepal_year'],
            "PAK": row['pakistan_year'],
            "LKA": row['sri_lanka_year']
        }

        country_year_type_map = {
            "AFG": row['afghanistan_year_type'],
            "BGD": row['bangladesh_year_type'],
            "IND": row['india_year_type'],
            "MDV": row['maldives_year_type'],
            "NPL": row['nepal_year_type'],
            "PAK": row['pakistan_year_type'],
            "LKA": row['sri_lanka_year_type']
        }

        # Remove None values from the dictionaries
        country_year_map = {k: v for k, v in country_year_map.items() if v is not None}
        country_year_type_map = {k: v for k, v in country_year_type_map.items() if v is not None}

        # Create and return the Indicator instance
        return cls(
            id=row['id'],
            indicator_id=row['indicator_id'],
            api_url=row['api_url'],
            category=row['category'],
            category_id=row['category_id'],
            dataset=row['dataset'],
            indicator_code=row['indicator_code'],
            indicator_name=row['indicator_name'],
            positive_negative_indicator=row['positive_negative_indicator'],
            number_percent=row['number_percent'],
            notes=row['notes'],
            country_year_map=country_year_map,
            country_year_type_map=country_year_type_map
        )


    def increment_counts(self, country_id, year):
        """Increments the counts for the given year and year_type."""
        year_type = self.country_year_type_map.get(country_id)
        self.year_counts[year] += 1
        self.year_type_counts[year_type] += 1