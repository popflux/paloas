require_relative 'parking_lot'
require_relative 'car'

cmd = ARGV.first
prompt = "Input: "

if cmd.nil?
  begin  
    puts prompt
    inputs = inputs = gets.chomp.split(" ")
    func = inputs[0]
    params = [inputs[1], inputs[2]]

    if func == "create_parking_lot"
      pl = ParkingLot.new(params[0].to_i)
      puts pl.parking_lot_info
    elsif func == "park"
      reg_number = params[0]
      car_colour = params[1]
      puts Car.park(reg_number, car_colour)
    elsif func == "leave"
      puts Car.leave(params[0].to_i)
    elsif func == "status"
      puts "\nOutput: "
      puts "| Slot No. |  Registration No.  |   Colour   |"
      puts Car.status
      puts "\n"
    elsif func == "registration_numbers_for_cars_with_colour"
      puts Car.registration_numbers_for_cars_with_colour(params[0])
    elsif func == "slot_numbers_for_cars_with_colour"
      puts Car.slot_numbers_for_cars_with_colour(params[0])
    elsif func == "slot_number_for_registration_number"
      puts Car.slot_number_for_registration_number(params[0])
    else
      unless func == "exit"
        puts "\nOutput: "
        puts "Command not found."
        puts "\n"
      end 
    end

  end until func == "exit"
end