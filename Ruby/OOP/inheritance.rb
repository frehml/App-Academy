class Employee
    def initialize(name, salary, title, boss)
        @name = name
        @title = title
        @salary = salary
        @boss = boss
        @subemployees = []

        boss.add_sub_employee(self) if !boss.nil? && boss.title != "Founder"
    end

    attr_reader :title, :salary

    def bonus(multiplier)
        @salary * multiplier
    end
end

class Manager < Employee
    def add_sub_employee(employee)
        @subemployees << employee
    end

    def bonus(multiplier)
        total = 0
        @subemployees.each{ |employee| total += employee.salary}
        total * multiplier
    end
end

ned = Employee.new("ned", 1000000, "Founder", nil)
darren = Manager.new("derren", 78000, "TA Manager", ned)
shawna = Employee.new("shawna", 12000, "TA", darren)
david = Employee.new("david", 10000, "TA", darren)

print "\n"
print ned.bonus(5) # => 500_000
print "\n"
print darren.bonus(4) # => 88_000
print "\n"
print david.bonus(3) # => 30_000
