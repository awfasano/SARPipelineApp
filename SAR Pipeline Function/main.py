import functions_framework
import logging
import worldBankData

# Configure logging
logging.basicConfig(level=logging.INFO)

@functions_framework.http
def hello_http(request):
    """HTTP Cloud Function.
    Args:
        request (flask.Request): The request object.
        <https://flask.palletsprojects.com/en/1.1.x/api/#incoming-request-data>
    Returns:
        The response text, or any set of values that can be turned into a
        Response object using `make_response`
        <https://flask.palletsprojects.com/en/1.1.x/api/#flask.make_response>.
    """
    request_json = request.get_json(silent=True)
    request_args = request.args

    if request_json and 'name' in request_json:
        name = request_json['name']
    elif request_args and 'name' in request_args:
        name = request_args['name']
    else:
        name = 'World'
    
    try:
        # Call the main function from worldBankData to fetch and log indicators
        worldBankData.main()
        logging.info("worldBankData.main() executed successfully.")
        return f'Hello {name}!'
    
    except Exception as e:
        # Log the error and return an error response
        logging.error(f"An error occurred: {e}")
        return f"An error occurred while processing your request: {str(e)}", 500
