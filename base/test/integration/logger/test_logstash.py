def test_logstash_install(host):
    package = host.package("logstash")
    assert package.is_installed

def test_logstash_start_service(host):
    service = host.service("logstash")
    assert service.is_running