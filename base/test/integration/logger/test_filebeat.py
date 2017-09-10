def test_filebeat_install(host):
    package = host.package("filebeat")
    assert package.is_installed

def test_filebeat_start_service(host):
    service = host.service("filebeat")
    assert service.is_running