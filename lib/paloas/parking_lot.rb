require_relative 'car'
require_relative '../helper/module_formatter'

class ParkingLot
  include Formatter

  @@available_slots = 0
  @@slots = Hash.new
  def initialize(num_of_slots)
    @@available_slots = num_of_slots
    @@slots = {}
    
    for i in 1..@@available_slots
      @@slots[i] = false
    end

    Car.delete_all
  end

  def self.available_slots_count
    @@available_slots
  end

  def self.get_all_slots
    @@slots
  end

  def self.update_slot(num)
    @@slots[num.to_i] = true
  end

  def self.available_slot_update
    @@available_slots -= 1
  end

  def parking_lot_info
    return formatted_output("Create parking lot with #{@@available_slots} slots")
  end

end