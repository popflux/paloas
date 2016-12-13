require "./lib/paloas/car.rb"
require "./lib/paloas/parking_lot.rb"
require "test/unit"

class TestPaloas < Test::Unit::TestCase

  def test_available_slots
    pl = ParkingLot.new(5)
    assert_equal(5, ParkingLot.available_slots_count)
  end

  def test_update_slots
    ParkingLot.new(2)
    assert_equal(true, ParkingLot.update_slot(1))
  end

  def test_available_slot_update
    ParkingLot.new(3)
    assert_equal(2, ParkingLot.available_slot_update)
  end

  def test_parking_lot_info
    pl = ParkingLot.new(5)
    assert_equal("\nOutput: \nCreate parking lot with 5 slots\n\n", pl.parking_lot_info)
  end

  def test_get_all_slots
    ParkingLot.new(2)
    assert_equal({1=>false, 2=>false}, ParkingLot.get_all_slots)
  end
  
  def test_slot_number_for_registration_number 
    car1 = Car.new("reg-num-1", "white", 1)
    car2 = Car.new("reg-num-2", "blue", 2)
    car3 = Car.new("reg-num-3", "black", 3)

    assert_equal("\nOutput: \n2\n\n", Car.slot_number_for_registration_number("reg-num-2"))
    assert_equal("\nOutput: \nNot found\n\n", Car.slot_number_for_registration_number("reg-num-4"))
  
    Car.delete_all
  end

  def test_slot_numbers_for_cars_with_colour 
    car1 = Car.new("reg-num-1", "white", 1)
    car2 = Car.new("reg-num-2", "blue", 2)
    car3 = Car.new("reg-num-3", "black", 3)

    assert_equal("\nOutput: \nNot found\n\n", Car.slot_numbers_for_cars_with_colour("green"))
    assert_equal("\nOutput: \n3\n\n", Car.slot_numbers_for_cars_with_colour("black"))

    Car.delete_all
  end

  def test_delete_cars
    car1 = Car.new("reg-num-1", "white", 1)
    car2 = Car.new("reg-num-2", "blue", 2)
    car3 = Car.new("reg-num-3", "black", 3)

    assert_equal([], Car.delete_all)
  
    Car.delete_all
  end

  def test_registration_numbers_for_cars_with_colour
    car1 = Car.new("reg-num-1", "white", 1)
    car2 = Car.new("reg-num-2", "blue", 2)
    car3 = Car.new("reg-num-3", "black", 3)

    assert_equal("\nOutput: \nreg-num-1\n\n", Car.registration_numbers_for_cars_with_colour("white"))
    assert_equal("\nOutput: \nNot found\n\n", Car.registration_numbers_for_cars_with_colour("green"))

    Car.delete_all
  end

  def test_leave
    car1 = Car.new("reg-num-1", "white", 1)
    car2 = Car.new("reg-num-2", "blue", 2)
    car3 = Car.new("reg-num-3", "black", 3)

    assert_equal("\nOutput: \nSlot number not found\n\n", Car.leave(4))
    assert_equal("\nOutput: \nSlot number 2 is free\n\n", Car.leave(2))

    Car.delete_all
  end

  def test_status
    car1 = Car.new("reg-num-1", "white", 1)
    assert_equal("| 1        |  reg-num-1         |   white    |\n", Car.status)
  end

  def test_park_car
    ParkingLot.new(1)

    assert_equal("\nOutput: \nAllocated slot numbers: 1\n\n", Car.park("reg-num-1", "red"))
    assert_equal("\nOutput: \nSorry, parking lot is full\n\n", Car.park("reg-num-2", "red"))
  
    Car.delete_all
  end

end