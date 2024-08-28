from collections import defaultdict

country_id_map = {
    'AFG': 4,     # Afghanistan
    'BGD': 50,    # Bangladesh
    'IND': 356,   # India
    'MDV': 462,   # Maldives
    'NPL': 524,   # Nepal
    'PAK': 586,   # Pakistan
    'LKA': 144    # Sri Lanka
}

country_iso3_map = {
    'AFG': "Afghanistan",     # Afghanistan
    'BGD': "Bangladesh",    # Bangladesh
    'IND': "India",   # India
    'MDV': "Maldives",   # Maldives
    'NPL': "Nepal",   # Nepal
    'PAK': "Pakistan",   # Pakistan
    'LKA': "Sri Lanka"    # Sri Lanka
}

country_iso3_map = {v: k for k, v in country_id_map.items()}  # Reverse mapping from numeric ID to ISO3 code
