require 'minitest/autorun'
require 'minitest/pride'

require './lib/market'
require 'pry'

class MarketTest < Minitest::Test

  def setup
    @m = Market.new("South Pearl Street Farmers Market")
  end

  def test_it_exists
    assert_instance_of Market, @m
  end

end