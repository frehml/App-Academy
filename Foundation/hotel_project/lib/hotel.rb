require_relative "room"

class Hotel

  def initialize(name, rooms_hash)
    @name = name
    @rooms = Hash.new 
    rooms_hash.each { |key, value| @rooms[key] = Room.new(value)}
  end
  
  def name
    cap_name = @name
    arr = cap_name.split(" ")
    arr.map! do |word|
        word.capitalize
    end
    return arr.join(" ")
  end

  def rooms
    return @rooms
  end

  def room_exists?(room_name)
    @rooms.has_key?(room_name)
  end

  def check_in(person, room_name)
    if self.room_exists?(room_name)
        @rooms[room_name].add_occupant(person)
        if @rooms[room_name].occupants.include?(person)
            print "check in successful"
        else
            print "sorry, room is full"
        end
    else
        print "sorry, room does not exist"
    end
  end

  def has_vacancy?
    @rooms.each_key do |key|
        if !@rooms[key].full?
            return true
        end
    end
    return false
  end

  def list_rooms
    @rooms.each_key do |key|
        print key + @rooms[key].available_space.to_s + "\n"
    end
  end
end
