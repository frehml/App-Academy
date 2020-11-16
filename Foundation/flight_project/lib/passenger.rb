class Passenger
    def initialize(name)
        @name = name
        @flight_numbers = []
    end
    def name
        @name
    end
    def has_flight?(flightnumber)
        @flight_numbers.include?(flightnumber.upcase)
    end
    def add_flight(flightnumber)
        @flight_numbers << flightnumber.upcase if !has_flight?(flightnumber)
    end
end