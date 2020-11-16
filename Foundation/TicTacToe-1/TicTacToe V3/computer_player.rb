class ComputerPlayer
    attr_accessor :mark
    def initialize(mark_value)
        @mark = mark_value
    end
    def get_position(legal_positions)
        position = legal_positions[rand(0...legal_positions.length)]
        puts "Player " + self.mark.to_s + " chose coordinate " + position.to_s
        return position
    end
end