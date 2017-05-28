from flask import Flask

__version__ = '0.2'

app = Flask(__name__)

@app.route('/')
def index():
    return 'Hello from salt'

app.run(host='0.0.0.0', port='8000')