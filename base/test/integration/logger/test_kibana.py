def test_kibana_install(host):
    package = host.package("kibana")
    assert package.is_installed

def test_kibana_start_service(host):
    service = host.service("kibana")
    assert service.is_running

def test_kibana_port(host):
    socket = host.socket('tcp://127.0.0.1:5601')
    assert socket.is_listening