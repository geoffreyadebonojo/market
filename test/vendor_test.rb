require 'minitest/autorun'
require 'minitest/pride'

require './lib/vendor'

class VendorTest < Minitest::Test

  def setup
    @v = Vendor.new("Rocky Mountain Fresh")
    @hash = {}
  end

  def test_it_exists
    assert_instance_of Vendor, @v
  end

  def test_it_has_attrubutes
    assert_equal "Rocky Mountain Fresh", @v.name
  end

  def test_inventory_is_empty_hash
    assert_equal @hash, @v.inventory
  end

  def test_it_can_check_stock
    assert_equal 0, @v.check_stock("Peaches")
  end
end