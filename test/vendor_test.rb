require 'minitest/autorun'
require 'minitest/pride'

require './lib/vendor'

class VendorTest < Minitest::Test

  def setup
    @v = Vendor.new("Rocky Mountain Fresh")
  end

  def test_it_exists
    assert_instance_of Vendor, @v
  end

  def test_it_has_attrubutes
    assert_equal "Rocky Mountain Fresh", @v.name
  end
end