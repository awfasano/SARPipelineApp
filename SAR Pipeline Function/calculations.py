import pandas as pd
from sqlalchemy import create_engine, MetaData, Table, select
from sqlalchemy.sql import and_
import logging
from collections import defaultdict

def standardize_from_db(engine, table_name, indicator_id, year_type):
    # Reflect the table from the database
    metadata = MetaData(bind=engine)
    table = Table(table_name, metadata, autoload_with=engine)

    # Step 1: Fetch the relevant data from the database
    query = select([
        table.c.value
    ]).where(
        and_(
            table.c.indicator_id == indicator_id,
            table.c.year_type == year_type
        )
    )

    df = pd.read_sql(query, engine)

    if df.empty:
        logging.info("No data found for the given indicator_id and year_type.")
        return None

    # Step 2: Calculate min and max
    min_value = df['value'].min()
    max_value = df['value'].max()

    if max_value == min_value:
        logging.warning("Max value is equal to min value, standardization not possible.")
        return None

    # Step 3: Calculate standardized values
    df['value_standardized'] = 100 * (df['value'] - min_value) / (max_value - min_value)

    # Update the standardized values in the database
    with engine.connect() as connection:
        for index, row in df.iterrows():
            update_query = table.update().values(
                value_standardized=row['value_standardized']
            ).where(
                and_(
                    table.c.indicator_id == indicator_id,
                    table.c.year_type == year_type,
                    table.c.value == row['value']
                )
            )
            connection.execute(update_query)

    logging.info("Standardized values updated successfully.")

# Example usage:
# Create a SQLAlchemy engine
engine = create_engine('postgresql://awfasano:football3@34.162.122.101:5432/scorecard')

# Call the function to standardize values
standardize_from_db(engine, 'indicator_data', indicator_id=7, year_type=1)
