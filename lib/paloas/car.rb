require_relative '../helper/module_formatter.rb'

class Car
	extend Formatter

  @@cars = Array.new
  
  attr_reader :registration_number, :colour, :slot

  def initialize(registration_number, colour, slot)
    @registration_number = registration_number
    @colour = colour
    @slot = slot
    params = {:registration_number => registration_number, :colour => colour, :slot => slot}
    @@cars << params
  end

  def self.leave(sl)
    current_size = @@cars.length
    after_deletion = @@cars.delete_if { |c| c[:slot] == sl }
    new_size = after_deletion.length

    if current_size == new_size
      return formatted_output("Slot number not found")
    else
      return formatted_output("Slot number #{sl} is free")
    end

  end

  def self.status
    result = ""
    if !@@cars.empty?
      @@cars.each do |car|
        result += "| #{car[:slot].to_s.ljust(9, ' ')}|  #{car[:registration_number].ljust(15, ' ')}   |   #{car[:colour].ljust(9, ' ')}|\n"
      end
    end
    return result
  end

  def self.registration_numbers_for_cars_with_colour(clr)
    results = @@cars.select { |k, v| k[:colour] == clr }
    reg_numbers = results.map { |c| c[:registration_number] }

    if results.empty?
      return formatted_output("Not found")
    else
    	return formatted_output(reg_numbers.join(", "))
    end

  end

  def self.slot_numbers_for_cars_with_colour(clr)
    results = @@cars.select { |k, v| k[:colour] == clr }
    slot_numbers = results.map { |c| c[:slot] }
  	if results.empty?
      return formatted_output("Not found")
    else
    	return formatted_output(slot_numbers.join(", "))
    end
  end

  def self.slot_number_for_registration_number(reg_num)
    results = @@cars.select { |k, v| k[:registration_number] == reg_num }
    if results.empty?
      return formatted_output("Not found")
    else
      return formatted_output(results.first[:slot])
    end
  end

  def self.delete_all
  	@@cars = []
  end

  def self.index
    @@cars.sort_by { |o| o[:slot] }
  end

end