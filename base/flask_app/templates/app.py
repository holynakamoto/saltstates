import salt.client
from flask import Flask

__version__ = '0.2'

app = Flask(__name__)
caller = salt.client.Caller()
mined_ips = caller.cmd('mine.get', 'web01', 'network.ip_addrs')

@app.route('/')
def index():
    return 'Hello from salt, this is the web01 IP {0}'.format(mined_ips['web01'])

app.run(host='0.0.0.0', port='8000')