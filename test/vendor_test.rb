require 'minitest/autorun'
require 'minitest/pride'

require './lib/vendor'
require 'pry'

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

  def test_it_can_stock_items
    inventory_hash = {"Peaches" => 55, "Tomatoes" => 12}

    @v.stock("Peaches", 30)
    assert_equal 30, @v.check_stock("Peaches")
    @v.stock("Peaches", 25)
    assert_equal 55, @v.check_stock("Peaches")
    @v.stock("Tomatoes", 12)
    assert_equal inventory_hash, @v.inventory
  end



end