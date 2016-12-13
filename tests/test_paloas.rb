require "./lib/paloas/car.rb"
require "test/unit"

class TestPaloas < Test::Unit::TestCase
  
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

end