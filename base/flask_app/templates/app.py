from flask import Flask

__version__ = '0.2'

app = Flask(__name__)

@app.route('/')
def index():
    return 'Hello from salt, this is the ip from web01 {0}'.format("{{ web01_ip }}")

app.run(host='0.0.0.0', port='8000')