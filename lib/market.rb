class Market

  attr_reader :name,
              :vendors

  def initialize(name)
    @name = name
    @vendors = []
  end

  def add_vendor(vendor)
    @vendors << vendor
  end
  
  def vendor_names
    @vendors.map do |vendor|
      vendor.name
    end
  end

  def vendors_that_sell(item)
    @vendors.find_all do |v|
      v.inventory.include?(item)
    end
  end

  def sorted_item_list
    vendor_inventory = @vendors.map do |vendor|
      vendor.inventory.keys
    end

    all_items = vendor_inventory.flatten(2).uniq
    all_items.sort
  end

  def total_inventory

    vendor_inventory = @vendors.map do |vendor|
      vendor.inventory.keys
    end

    all_items = vendor_inventory.flatten(2).uniq

    inventory_of_all_items = Hash.new(0)
    a = all_items.each do |item|
      @vendors.each do |vendor|
        inventory_of_all_items[item] += vendor.check_stock(item)
      end
    end

    inventory_of_all_items
  end
end 