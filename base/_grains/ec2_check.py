#!/usr/bin/env python

import urillib2
from urllib2 import URLError

def ec2_check():

    # Initialize grains dictionary
    grains = {}

    # Initialize base url
    base_url = 'http://169.254.169.254/latest/meta-data/'

    try:

        # Initialize grains cloud info
        grains['cloud_info'] = []

        # Set instnace Id and instance type
        instance_id = urllib2.urlopen(base_url + 'instance-id')
        instance_type = urllib2.urlopen(base_url + 'instance-type')

        grains['cloud_info'].append({'provider': 'Amazon'})
        grains['cloud_info'][0]['instance_id'] = instance_id
        grains['cloud_info'][0]['instance_type'] = instance_type

        return grains
    except URLError:
        return False

if __name__ == '__main__':
    ec2_check()