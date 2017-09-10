def test_elasticsearch_install(host):
    package = host.package("elasticsearch")
    assert package.is_installed

def test_elasticsearch_start_service(host):
    service = host.service("elasticsearch")
    assert service.is_running

def test_elasticsearch_port(host):
    socket = host.socket('tcp://127.0.0.1:9200')
    assert socket.is_listening