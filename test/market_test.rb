require 'minitest/autorun'
require 'minitest/pride'

require './lib/vendor'
require './lib/market'
require 'pry'

class MarketTest < Minitest::Test

  def setup
    @m = Market.new("South Pearl Street Farmers Market")
    
  end

  def test_it_exists
    assert_instance_of Market, @m
  end

  def test_it_has_attributes
    assert_equal "South Pearl Street Farmers Market", @m.name
    assert_equal [], @m.vendors
  end

  def test_it_can_add_vendors
    vendor_1 = Vendor.new("Rocky Mountain Fresh")
    vendor_1.stock("Peaches", 35)
    vendor_1.stock("Tomatoes", 7)

    vendor_2 = Vendor.new("Ba-Nom-a-Nom") 
    vendor_2.stock("Banana Nice Cream", 50)
    vendor_2.stock("Peach-Raspberry Nice Cream", 25)

    vendor_3 = Vendor.new("Palisade Peach Shack")
    vendor_3.stock("Peaches", 65)

    @m.add_vendor(vendor_1)
    @m.add_vendor(vendor_2)
    @m.add_vendor(vendor_3)

    expected = [vendor_1, vendor_2, vendor_3]

    assert_equal expected, @m.vendors 
  end

  def test_it_can_read_vendor_names
    vendor_1 = Vendor.new("Rocky Mountain Fresh")
    vendor_1.stock("Peaches", 35)
    vendor_1.stock("Tomatoes", 7)

    vendor_2 = Vendor.new("Ba-Nom-a-Nom") 
    vendor_2.stock("Banana Nice Cream", 50)
    vendor_2.stock("Peach-Raspberry Nice Cream", 25)

    vendor_3 = Vendor.new("Palisade Peach Shack")
    vendor_3.stock("Peaches", 65)

    @m.add_vendor(vendor_1)
    @m.add_vendor(vendor_2)
    @m.add_vendor(vendor_3)
    
    expected = ["Rocky Mountain Fresh", "Ba-Nom-a-Nom", "Palisade Peach Shack"]
    assert_equal expected, @m.vendor_names
  end

end