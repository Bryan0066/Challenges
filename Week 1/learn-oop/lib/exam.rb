
class Exam

    attr_accessor :grade

    def initialize(title, due_date)
        @title = title
        @due_date = due_date
        @assigned_to = nil
        @grade = nil
    end

    def assigned_to=(students)
        @assigned_to = students
        
    end
    
end