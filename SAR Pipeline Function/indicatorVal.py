import indicator
from collections import defaultdict

class IndicatorValue:
    def __init__(self, indicator, value, country, standardized_value, table_standardized_value):
        self.indicator = indicator  # This is an instance of the Indicator class
        self.value = value  # This is the value associated with the indicator
        self.country = country  # This is the country associated with the indicator value
        self.standardized_value = standardized_value  # The standardized value
        self.table_standardized_value = table_standardized_value  # The table standardized value
        self.notes = ""  # Initialize notes as an empty string

    def __repr__(self):
        return (f"IndicatorValue(indicator={self.indicator.indicator_name}, "
                f"value={self.value}, country={self.country}, "
                f"standardized_value={self.standardized_value}, "
                f"table_standardized_value={self.table_standardized_value})")