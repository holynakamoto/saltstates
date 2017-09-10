#!/usr/bin/env python3

import testinfra
import os
import pytest

SSH_CONFIG = '.ssh-config'

@pytest.fixture
def host(request, tmpdir):

    ssh_config_file = tmpdir.join(SSH_CONFIG)
    ssh_config_file.write('Host {0}\nUser {1}\nPort {2}\nIdentityFile {3}\n StrictHostKeyChecking no\n'.format(
        os.environ['KITCHEN_HOSTNAME'],
        os.environ['KITCHEN_USERNAME'],
        os.environ['KITCHEN_PORT'],
        os.environ['KITCHEN_SSH_KEY']
        )
    )

    testinfra.backend.get_backends('localhost')

    yield testinfra.get_host('paramiko://{0}@{1}'.format(os.environ['KITCHEN_USERNAME'], os.environ['KITCHEN_HOSTNAME']), ssh_config=ssh_config_file, sudo=True)