def test_port_8000_is_listening(Socket):
    socket = Socket("tcp://0.0.0.0:8000")
    assert socket.is_listening

def test_apache_server_is_running(Service):
    service = Service("httpd")
    assert service.is_running
    assert service.is_enabled