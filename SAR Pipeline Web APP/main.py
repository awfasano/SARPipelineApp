from flask import Flask, render_template, jsonify
from Classes.Indicator import get_all_indicators, Indicator
from Classes.ScorecardValues import get_scorecard_indicator2_data, ScoreCardIndicator2
from Classes.ScorecardChart import get_scorecard_chart_data, ScoreCardChart

from db import Session, init_db


app = Flask(__name__)

def initialize_database():
    """Initialize the database."""
    with app.app_context():
        init_db()

@app.teardown_appcontext
def shutdown_session(exception=None):
    """Remove the database session at the end of the request."""
    Session.remove()

@app.route('/')
def index():
    return render_template('chart.html')

@app.route('/data_entry')
def data_entry():
    return render_template('data_entry.html')

@app.route('/api/indicators', methods=['GET'])
def get_indicators():
    indicators = get_all_indicators()
    if indicators is not None:
        return jsonify(indicators)
    else:
        return jsonify({"error": "Internal server error"}), 500

@app.route('/api/scorecard_indicators', methods=['GET'])
def get_scorecard_indicators():
    try:
        indicators_scorecard = get_scorecard_indicator2_data()
        if indicators_scorecard:
            return jsonify(indicators_scorecard)
        else:
            return jsonify({"error": "No data found"}), 404
    except Exception as e:
        print(f"Error: {str(e)}")
        return jsonify({"error": str(e)}), 500
    finally:
        Session.remove()

@app.route('/api/scorecard_chart', methods=['GET'])
def get_scorecard_chart():
    try:
        chart_scorecard = get_scorecard_chart_data()
        if chart_scorecard:
            return jsonify(chart_scorecard)
        else:
            return jsonify({"error": "No data found"}), 404
    except Exception as e:
        print(f"Error: {str(e)}")
        return jsonify({"error": str(e)}), 500
    finally:
        Session.remove()

if __name__ == "__main__":
    initialize_database()
    app.run(debug=True, use_reloader=False)
