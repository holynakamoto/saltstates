import socket

def check_development_hostname():

    # Instantiate grains dictionary
    grains = {}

    # Collect hostname
    hostname = socket.gethostname()

    # Test hostname condition
    if 'vagrant' in hostname.lower():
        grains['cloud_info'] = []
        grains.append({'provider': 'vagrant'})

    return grains

if __name__ == '__main__':
    check_development_hostname()