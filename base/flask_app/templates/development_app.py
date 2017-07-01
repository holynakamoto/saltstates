#import salt.client
from flask import Flask

__version__ = '0.2'

app = Flask(__name__)
#mined_ips = salt.client.Caller()
#web01_ip = mined_ips.cmd('mine.get', 'web01', 'network.ip_addrs')
{% set web01_ip = '2.2.2.2' %}

@app.route('/')
def index():
    return 'Hello from salt, this is the ip from web01 {0}'.format("{{ web01_ip }}")

app.run(host='0.0.0.0', port='8000')