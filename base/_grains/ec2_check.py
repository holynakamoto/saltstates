import urllib2

def ec2_check():

    # Instantiate grains dictionary
    grains = {}

    try:

        # Base url
        base_url = 'http://169.254.169.254/latest/meta-data/'

        instance_id = urllib2.urlopen(base_url + '/instance-id')
        instance_type = urllib2.urlopen(base_url + 'instance-type')
        instance_id = instance_id.read()
        instance_type = instance_type.read()

        # Instiate grains key cloud info
        grains['cloud_info'] = []

        grains['cloud_info'].append({'provider': 'Amazon'})
        grains['cloud_info'][0]['instance_id'] = instance_id
        grains['cloud_info'][0]['instance_type'] = instance_type
        return grains
    except urllib2.URLError:
        return False

if __name__ == '__main__':
    ec2_check()
