require "pry"

class SystemCheck

    attr_reader :submissions, :name

    def initialize(name, due_date)
      @name = name
      @due_date = due_date
      @submissions = []
    end

    def add_submission(submission)
        @submissions << submission
    end

    def average_grade
      grades = []
      
      @submissions.each do |submission|
        grades << submission.grade
      end

      grades.sum.to_f / grades.length.to_f
      
    end

    def did_student_complete_system_check? (student_object)
      students_who_submitted = []

      @submissions.each do |submission|
         students_who_submitted << submission.student.name
      end
    
      students_who_submitted.include?(student_object.name)
      
    end
    
end
