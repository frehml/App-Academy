class Item
    attr_reader :done
    def self.valid_date?(date_string)
        date_array = date_string.split("-")
        date_array[2].to_i <= 31 && date_array[1].to_i <= 12
    end
    def initialize(title, deadline, description)
        @title = title
        @deadline = deadline
        @description = description
        @done = false
        raise "Invalid date" if !Item.valid_date?(deadline)
    end
    def title
        @title
    end
    def title=(new_title)
        @title = new_title
    end
    def deadline
        @deadline
    end
    def deadline=(new_deadline)
        raise "Invalid date" if !Item.valid_date?(new_deadline)
        @deadline = new_deadline
    end
    def description
        @description
    end
    def description=(new_description)
        @description = new_description
    end
    def toggle
        if @done == true
            @done = false
        else
            @done = true
        end
    end
end

#p my_item = Item.new('Fix login page', '2019-10-22', 'It loads slow.')
#p my_item.deadline = "2019-10-23"
#p my_item.deadline