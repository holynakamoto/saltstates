def test_apache_service(Service):
    service = Service('httpd')
    assert service.is_running