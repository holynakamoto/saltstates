def test_java8_installed(host):
    java8_test = host.package("jdk1.8.0_131-1.8.0_131-fcs")
    assert java8_test.is_installed
