class SystemCheckSubmission

    attr_reader :solution, :student, :grade

    def initialize(solution, student)
      @solution = solution
      @student = student
    end

    def assign_grade(grade)
      if grade >= 0 && grade <=3
        @grade = grade
      else
        return "Invalid Grade Error!"
      end
    end

    def graded?
      !@grade.nil?
    end

end
