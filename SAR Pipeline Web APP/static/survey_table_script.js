let indicatorDict = {};
let appliedFilters = {
    indicator: '',
    yearType: '',
    country: ''
};

async function loadIndicators() {
    try {
        const response = await fetch('/api/scorecard_indicators');
        if (!response.ok) throw new Error(`HTTP error! Status: ${response.status}`);

        const indicators = await response.json();
        if (!Array.isArray(indicators)) throw new Error('The fetched data is not an array. Check the API response structure.');

        indicators.forEach(indicator => {
            const { ID, Category_ID, Secondary_ID, Group_Name, Indicator_Name, Proxy, Country, Year, Year_Type, Source, Value, Value_N, Value_Map, Value_Standardized, Positive, Value_Standardized_Table, Indicator_Details } = indicator;

            if (Indicator_Details) {  // Only process indicators with valid Indicator_Details
                const indicatorId = Indicator_Details.IndicatorID;

                // Build Indicator Dictionary organized by indicatorId
                if (!indicatorDict[indicatorId]) {
                    indicatorDict[indicatorId] = {
                        indicatorDetails: Indicator_Details,
                        data: {}
                    };
                }

                // Organize data by year_type
                if (!indicatorDict[indicatorId].data[Year_Type]) {
                    indicatorDict[indicatorId].data[Year_Type] = {};
                }

                // Organize data by country under each year_type
                if (!indicatorDict[indicatorId].data[Year_Type][Country]) {
                    indicatorDict[indicatorId].data[Year_Type][Country] = {};
                }

                // Store the data with year as an additional key
                indicatorDict[indicatorId].data[Year_Type][Country][Year] = {
                    ID, Category_ID, Secondary_ID, Group_Name, Indicator_Name, Proxy, Source, Value, Value_N, Value_Map, Value_Standardized, Positive, Value_Standardized_Table
                };
            }
        });

        // Populate filters after loading data
        console.log('Finished loading indicators. Populating filters now.');
        populateFilters();

        document.getElementById('showAll').addEventListener('click', clearFilters);

    } catch (error) {
        console.error('Error fetching indicators:', error);
    }
}

function populateFilters() {
    const indicatorFilter = document.getElementById('indicatorFilter');
    const yearTypeFilter = document.getElementById('yearTypeFilter');
    const countryFilter = document.getElementById('countryFilter');

    // Clear existing options
    indicatorFilter.innerHTML = '<option value="">All Indicators</option>';
    yearTypeFilter.innerHTML = '<option value="">All Year Types</option>';
    countryFilter.innerHTML = '<option value="">All Countries</option>';

    // Populate Indicator Filter
    for (const indicatorId in indicatorDict) {
        const option = document.createElement('option');
        option.value = indicatorId;
        option.text = indicatorDict[indicatorId].indicatorDetails.IndicatorName;
        indicatorFilter.appendChild(option);
    }

    // Populate Year Type Filter
    const yearTypes = new Set();
    for (const indicatorId in indicatorDict) {
        for (const yearType in indicatorDict[indicatorId].data) {
            yearTypes.add(yearType);
        }
    }
    yearTypes.forEach(yearType => {
        const option = document.createElement('option');
        option.value = yearType;
        option.text = `Year Type ${yearType}`;
        yearTypeFilter.appendChild(option);
    });

    // Populate Country Filter
    const countries = new Set();
    for (const indicatorId in indicatorDict) {
        for (const yearType in indicatorDict[indicatorId].data) {
            for (const country in indicatorDict[indicatorId].data[yearType]) {
                countries.add(country);
            }
        }
    }
    countries.forEach(country => {
        const option = document.createElement('option');
        option.value = country;
        option.text = country;
        countryFilter.appendChild(option);
    });
}

function applyIndicatorFilter() {
    const indicatorFilter = document.getElementById('indicatorFilter').value;
    appliedFilters.indicator = indicatorFilter;
    applyFilters();
}

function applyYearTypeFilter() {
    const yearTypeFilter = document.getElementById('yearTypeFilter').value;
    appliedFilters.yearType = yearTypeFilter;
    applyFilters();
}

function applyCountryFilter() {
    const countryFilter = document.getElementById('countryFilter').value;
    appliedFilters.country = countryFilter;
    applyFilters();
}

function applyFilters() {
    const filteredData = [];

    for (const [indicatorId, indicatorData] of Object.entries(indicatorDict)) {
        // Filter by indicator if an indicator filter is applied
        if (appliedFilters.indicator && indicatorId !== appliedFilters.indicator) continue;

        for (const [yearType, countries] of Object.entries(indicatorData.data)) {
            // Filter by year type if a year type filter is applied
            if (appliedFilters.yearType && yearType !== appliedFilters.yearType) continue;

            for (const [country, yearsData] of Object.entries(countries)) {
                // Filter by country if a country filter is applied
                if (appliedFilters.country && country !== appliedFilters.country) continue;

                for (const year in yearsData) {
                    filteredData.push({
                        year,
                        yearType,
                        country,
                        ...yearsData[year],
                        IndicatorName: indicatorData.indicatorDetails.IndicatorName,
                    });
                }
            }
        }
    }

    displayFilteredData(filteredData);
}

function clearFilters() {
    // Reset all filters
    appliedFilters = {
        indicator: '',
        yearType: '',
        country: ''
    };

    // Reset dropdowns to "All" option
    document.getElementById('indicatorFilter').value = '';
    document.getElementById('yearTypeFilter').value = '';
    document.getElementById('countryFilter').value = '';

    // Display all data
    applyFilters();
}

function displayFilteredData(data) {
    const container = document.getElementById('organizedTables');
    container.innerHTML = '';

    if (data.length === 0) {
        container.innerHTML = '<p>No data found matching the filters.</p>';
        return;
    }

    let table = `<table><thead><tr><th>Year</th><th>Year Type</th><th>Country</th><th>Indicator Name</th><th>Category ID</th><th>Secondary ID</th><th>Group Name</th><th>Proxy</th><th>Source</th><th>Value</th><th>Value (Numeric)</th><th>Value Map</th><th>Value Standardized</th><th>Positive</th><th>Value Standardized (Table)</th><th>Actions</th></tr></thead><tbody>`;
    data.forEach(entry => {
        const rowId = `${entry.ID}-${entry.yearType}-${entry.country}-${entry.year}`;
        const indicatorId = entry.ID;  // This should be the actual `indicatorId`

        table += `<tr id="${rowId}">
                    <td>${entry.year}</td>
                    <td>${entry.yearType}</td>
                    <td>${entry.country}</td>
                    <td>${entry.IndicatorName}</td>
                    <td>${entry.Category_ID}</td>
                    <td>${entry.Secondary_ID}</td>
                    <td>${entry.Group_Name}</td>
                    <td>${entry.Proxy}</td>
                    <td>${entry.Source}</td>
                    <td>${entry.Value}</td>
                    <td>${entry.Value_N}</td>
                    <td>${entry.Value_Map}</td>
                    <td>${entry.Value_Standardized}</td>
                    <td>${entry.Positive}</td>
                    <td>${entry.Value_Standardized_Table}</td>
                    <td><button onclick="showSurveyForm('${rowId}', '${indicatorId}', '${entry.yearType}', '${entry.country}', '${entry.year}')">Edit</button></td>
                  </tr>`;
        table += `<tr id="form-${rowId}" style="display: none;"><td colspan="16"></td></tr>`; // Empty row for the form
    });
    table += '</tbody></table>';
    container.innerHTML = table;
}



function showSurveyForm(rowId, indicatorId, yearType, country, year) {
    // Check if the indicatorId is valid
    if (!indicatorDict[indicatorId]) {
        console.error(`Indicator ID ${indicatorId} not found.`);
        return;
    }

    // Check if the yearType exists in the indicator's data
    const indicatorData = indicatorDict[indicatorId].data[yearType];
    if (!indicatorData) {
        console.error(`Year Type ${yearType} not found for Indicator ID ${indicatorId}.`);
        return;
    }

    // Check if the country exists for the selected year type
    const countryData = indicatorData[country];
    if (!countryData) {
        console.error(`Country ${country} not found for Year Type ${yearType} and Indicator ID ${indicatorId}.`);
        return;
    }

    // Check if the year exists for the selected country
    const data = countryData[year];
    if (!data) {
        console.error(`Year ${year} not found for Country ${country}, Year Type ${yearType}, and Indicator ID ${indicatorId}.`);
        return;
    }

    const formRow = document.getElementById(`form-${rowId}`);
    const indicatorDetails = indicatorDict[indicatorId].indicatorDetails;

    formRow.style.display = ''; // Show the form row
    formRow.innerHTML = `
        <td colspan="16">
            <div id="surveyForm">
                <h3>Survey Form for ${indicatorDetails.IndicatorName}</h3>
                <form id="surveyDataForm-${rowId}">
                    <div class="form-group">
                        <label for="yearInput-${rowId}">Year:</label>
                        <input type="text" id="yearInput-${rowId}" value="${year}" />
                    </div>

                    <div class="form-group">
                        <label for="yearTypeInput-${rowId}">Year Type:</label>
                        <input type="text" id="yearTypeInput-${rowId}" value="${yearType}" />
                    </div>

                    <div class="form-group">
                        <label for="countryInput-${rowId}">Country:</label>
                        <input type="text" id="countryInput-${rowId}" value="${country}" />
                    </div>

                    <div class="form-group">
                        <label for="idInput-${rowId}">ID:</label>
                        <input type="text" id="idInput-${rowId}" value="${data.ID}" />
                    </div>

                    <div class="form-group">
                        <label for="categoryIdInput-${rowId}">Category ID:</label>
                        <input type="text" id="categoryIdInput-${rowId}" value="${data.Category_ID}" />
                    </div>

                    <div class="form-group">
                        <label for="secondaryIdInput-${rowId}">Secondary ID:</label>
                        <input type="text" id="secondaryIdInput-${rowId}" value="${data.Secondary_ID}" />
                    </div>

                    <div class="form-group">
                        <label for="groupNameInput-${rowId}">Group Name:</label>
                        <input type="text" id="groupNameInput-${rowId}" value="${data.Group_Name}" />
                    </div>

                    <div class="form-group">
                        <label for="indicatorNameInput-${rowId}">Indicator Name:</label>
                        <input type="text" id="indicatorNameInput-${rowId}" value="${data.Indicator_Name}" />
                    </div>

                    <div class="form-group">
                        <label for="proxyInput-${rowId}">Proxy:</label>
                        <input type="text" id="proxyInput-${rowId}" value="${data.Proxy}" />
                    </div>

                    <div class="form-group">
                        <label for="sourceInput-${rowId}">Source:</label>
                        <input type="text" id="sourceInput-${rowId}" value="${data.Source}" />
                    </div>

                    <div class="form-group">
                        <label for="valueInput-${rowId}">Value:</label>
                        <input type="text" id="valueInput-${rowId}" value="${data.Value}" />
                    </div>

                    <div class="form-group">
                        <label for="valueNInput-${rowId}">Value (Numeric):</label>
                        <input type="text" id="valueNInput-${rowId}" value="${data.Value_N}" />
                    </div>

                    <div class="form-group">
                        <label for="valueMapInput-${rowId}">Value Map:</label>
                        <input type="text" id="valueMapInput-${rowId}" value="${data.Value_Map}" />
                    </div>

                    <div class="form-group">
                        <label for="valueStandardizedInput-${rowId}">Value Standardized:</label>
                        <input type="text" id="valueStandardizedInput-${rowId}" value="${data.Value_Standardized}" />
                    </div>

                    <div class="form-group">
                        <label for="positiveInput-${rowId}">Positive:</label>
                        <input type="text" id="positiveInput-${rowId}" value="${data.Positive}" />
                    </div>

                    <div class="form-group">
                        <label for="valueStandardizedTableInput-${rowId}">Value Standardized (Table):</label>
                        <input type="text" id="valueStandardizedTableInput-${rowId}" value="${data.Value_Standardized_Table}" />
                    </div>

                    <button type="button" onclick="saveSurveyData('${rowId}', '${indicatorId}', '${yearType}', '${country}', '${year}')">Save</button>
                </form>
            </div>
        </td>
    `;
}

function saveSurveyData(rowId, indicatorId, yearType, country, year) {
    // Here you would collect data from the form and save it
    const form = document.getElementById(`surveyDataForm-${rowId}`);

    // For demonstration, we'll just close the form and show an alert
    document.getElementById(`form-${rowId}`).style.display = 'none';
    alert('Data saved successfully!');
}

window.addEventListener('load', loadIndicators);
