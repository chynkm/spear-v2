require File.expand_path '../../test_helper.rb', __FILE__
require File.expand_path '../../../app/models/port.rb', __FILE__

# Test for Port model
class PortTest < MiniTest::Test

  def setup
    @port = Port.new(name: 'Server 1', host: 'lbit.in', port: 80, probe_interval: 1)
  end

  def test_name_is_required
    assert @port.valid?, 'Host without name is being saved'
  end

  def test_name_is_less_than_255_character
    @port.name = 'This helper validates the length of the attributes values. It provides a variety of options,
    so you can specify length constraints in different ways.This helper validates the length of the attributes
    values. It provides a variety of options, so you can specify length constraints in different ways'
    assert @port.invalid?, 'Host with name count greater than 255 is invalid'
  end

  def test_name_with_255_characters
    @port.name = 'This helper validates the length of the attributes values. It provides a variety of options, ' \
    'so you can specify length constraints in different ways.This helper validates the length of the attributes' \
    ' values. It provides a variety of options, so you cannot'
    assert @port.valid?, 'Host with name count 255 is valid'
  end

  def test_name_with_1_character
    @port.name = 'A'
    assert @port.valid?, 'Host with name count 1 is valid'
  end

  def test_host_is_required
    assert @port.valid?, 'Host without host is being saved'
  end

  def test_valid_host_one
    @port.host = 'google.com'
    assert @port.valid?, 'google.com is valid host'
  end

  def test_valid_host_two
    @port.host = 'aws.amazon.com'
    assert @port.valid?, 'aws.amazon.com is valid host'
  end

  def test_invalid_host_one
    @port.host = 'goo'
    refute @port.valid?, 'goo is invalid host'
  end

  def test_invalid_host_two
    @port.host = 'goo.inc'
    refute @port.valid?, 'goo.inc is invalid host'
  end

  def test_valid_ip
    @port.host = '192.168.1.1'
    assert @port.valid?, '192.168.1.1 is valid IP'
  end

  def test_invalid_ip
    @port.host = '11.1'
    refute @port.valid?, '11.1 is invalid IP'
  end

  def test_invalid_ip_with_string
    @port.host = 'aaaa'
    refute @port.valid?, 'aaaa is invalid IP'
  end

  def test_probe_interval_is_required
    assert @port.valid?, 'Probe interval is required'
  end

  def test_probe_interval_float_value
    @port.probe_interval = 11.1
    refute @port.valid?, 'Probe interval does not support float'
  end

  def test_probe_interval_int_value
    @port.probe_interval = 11
    assert @port.valid?, 'Probe interval supports int'
  end

  def test_probe_interval_string_value
    @port.probe_interval = ''
    refute @port.valid?, 'Probe interval does not support string'
  end

  def test_port_is_required
    assert @port.valid?, 'Port is required'
  end

  def test_port_float_value
    @port.port = 11.1
    refute @port.valid?, 'Port does not support float'
  end

  def test_port_int_value
    @port.port = 11
    assert @port.valid?, 'Port supports int'
  end

  def test_port_string_value
    @port.port = ''
    refute @port.valid?, 'Port does not support string'
  end

  def test_port_value_minimum_valid
    @port.port = 1
    assert @port.valid?, 'Port value 1 is valid'
  end

  def test_port_value_minimum_invalid_one
    @port.port = 0
    refute @port.valid?, 'Port min value 0 is not supported'
  end

  def test_port_value_minimum_invalid_two
    @port.port = -1
    refute @port.valid?, 'Port min value -1 is not supported'
  end

  def test_port_value_between_max_and_min
    @port.port = 9999
    assert @port.valid?, 'Port 80 is valid'
  end

  def test_port_value_maximum_valid
    @port.port = 65535
    assert @port.valid?, 'Port value 65535 is valid'
  end

  def test_port_value_maximum_invalid
    @port.port = 65536
    refute @port.valid?, 'Port value 65536 is not supported'
  end

  def test_port_value_maximum_invalid_one
    @port.port = 88888
    refute @port.valid?, 'Port value 88888 is not supported'
  end

end

