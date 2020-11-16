require "employee"

class Startup

    attr_reader :name, :funding, :salaries, :employees

def initialize(name, funding, salaries)
    @name = name 
    @funding = funding 
    @salaries = salaries
    @employees = []
end

def valid_title?(title)
    @salaries.has_key?(title)
end

def >(start_up)
    if self.funding >(start_up).funding
        return true
    else
        return false
    end
end

def hire(employee_name, title)
    if self.valid_title?(title)
        @employees << Employee.new(employee_name, title)
    else
        raise error
    end
end

def size
    return @employees.length
end

def pay_employee(employee_instance)
    salary = @salaries[employee_instance.title]

    if @funding > salary
        employee_instance.pay(salary)
        @funding -= salary
    else
        raise error
    end
end

def payday
@employees.each { |employee| self.pay_employee(employee)}
end

def average_salary
    sum = 0
    @employees.each { |employee| sum += @salaries[employee.title] }
    return sum / @employees.length
end

def close
    @employees = []
    @funding = 0
end

def acquire(start_up)
    @funding += start_up.funding

    (0...start_up.employees.length).each do |index|
        @employees << start_up.employees[index]
    end
    
    @salaries.merge!(start_up.salaries) { |key, v1 , v2| v1}

    start_up.close
end

end
