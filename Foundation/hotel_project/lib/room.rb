class Room
def initialize(capacity)
    @capacity = capacity
    @occupants = []
end

def capacity
    return @capacity
end

def occupants
    return @occupants
end

def full?
    if @occupants.length < @capacity
        return false
    else
        return true
    end
end

def available_space
available_spaces = self.capacity - self.occupants.length
return available_spaces
end

def add_occupant(name)
    if self.full?
        return false
    else
        @occupants << name
        return true
    end
end

end
