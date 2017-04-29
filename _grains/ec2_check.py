import urllib2
from urllib2 import HTTPError

def ec2_check():

    # Initialize grains to return
    grains = {}

    # Set the default meta-data URL
    def_url = 'http://169.254.169.254/latest/meta-data/'
    try:
        # Initialize urllib2
        instnace_id = urllib2.urlopen(def_url + 'instance-id')
        instance_type = urllib2.urlopen(def_url + 'instance-type')
        instance_region = urllib2.urlopen(def_url + 'placement/availability-zone/')

        # Get instance id
        instance_id = instnace_id.read()
        instance_type = instance_type.read()
        instance_region = instance_region.read()

        # Set grains provider to Amazon
        grains['cloud_info'] = []
        grains['cloud_info'].append({'provider': 'Amazon'})
        grains['cloud_info'].append({'instance_type': instnace_type})
        grains['cloud_info'].append({'instnace_region': instnace_region})

            return grains
        else:
            return False
    except HTTPError:
        return False

if __name__ == '__main__':
    ec2_check()
