require File.expand_path '../../test_helper.rb', __FILE__
require File.expand_path '../../../app/models/host.rb', __FILE__

class HostTest < MiniTest::Unit::TestCase

  include Rack::Test::Methods

  def app
    App # <- your application class name
  end

  # runs before every test
  def setup
    @host = Host.new
  end

  def test_name_is_required
    refute @host.valid?
    assert_not_nil @host.errors[:email]
  end
end