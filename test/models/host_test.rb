require File.expand_path '../../test_helper.rb', __FILE__
require File.expand_path '../../../app/models/host.rb', __FILE__

class HostTest < MiniTest::Test

  def app
    App # <- your application class name
  end

  # runs before every test
  def setup
    @host = Host.new(name: 'Server 1', url: 'http://spearweb.com', probe_interval: 1)
  end

  def test_name_is_required
    assert @host.valid?, 'Host without name is being saved'
  end

  def test_name_is_less_than_255_character
    @host.name = 'This helper validates the length of the attributes values. It provides a variety of options,
    so you can specify length constraints in different ways.This helper validates the length of the attributes
    values. It provides a variety of options, so you can specify length constraints in different ways'
    assert @host.invalid?, 'Host with name count greater than 255 is invalid'
  end

  def test_name_with_255_characters
    @host.name = 'This helper validates the length of the attributes values. It provides a variety of options, ' \
    'so you can specify length constraints in different ways.This helper validates the length of the attributes' \
    ' values. It provides a variety of options, so you cannot'
    assert @host.valid?, 'Host with name count 255 is valid'
  end

  def test_name_with_1_character
    @host.name = 'A'
    assert @host.valid?, 'Host with name count 1 is valid'
  end

  def test_url_is_required
    assert @host.valid?, 'Host without url is being saved'
  end

  def test_valid_url
    @host.url = 'http://google.com'
    assert @host.valid?, 'http://google.com is valid url'
  end

  def test_invalid_url
    @host.url = 'google.com'
    refute @host.valid?, 'google.com is invalid url'
  end

  def test_valid_ip
    @host.url = '192.168.1.1'
    assert @host.valid?, '192.168.1.1 is valid IP'
  end

  def test_invalid_ip
    @host.url = '11.1'
    refute @host.valid?, '11.1 is invalid IP'
  end

  def test_invalid_ip_with_string
    @host.url = 'aaaa'
    refute @host.valid?, 'aaaa is invalid IP'
  end

  def test_probe_interval_is_required
    assert @host.valid?, 'Probe interval is required'
  end

  def test_probe_interval_float_value
    @host.probe_interval = 11.1
    refute @host.valid?, 'Probe interval does not support float'
  end

  def test_probe_interval_int_value
    @host.probe_interval = 11
    assert @host.valid?, 'Probe interval supports int'
  end

  def test_probe_interval_string_value
    @host.probe_interval = ''
    refute @host.valid?, 'Probe interval does not support string'
  end

end

