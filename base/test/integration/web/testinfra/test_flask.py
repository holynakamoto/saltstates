def test_flask_port(Socket):
    socket = Socket('tcp://0.0.0.0:8000')
    assert socket.is_listening