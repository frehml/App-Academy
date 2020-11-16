class Card
    attr_reader :face_up, :face_value
    def initialize(face_value)
        @face_value = face_value
        @face_up = false
    end
    def display
        return @face_value if @face_up
        return " "
    end
    def hide
        @face_up = false
    end
    def reveal
        @face_up = true
    end
end
