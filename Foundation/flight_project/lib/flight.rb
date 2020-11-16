require_relative "passenger.rb"

class Flight
    def initialize(flightnumber, capacity)
        @flight_number = flightnumber
        @capacity = capacity
        @passengers = []
    end
    def passengers
        return @passengers
    end
    def full?
        @passengers.length >= @capacity
    end
    def board_passenger(passenger)
        @passengers << passenger if !self.full? && passenger.has_flight?(@flight_number)
    end
    def list_passengers
        return @passengers.split("=")
    end
    def [](index)
        return @passengers[index]
    end
    def <<(passenger)
        board_passenger(passenger)
    end
end