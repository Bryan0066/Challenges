class Cohort

    attr_reader :title, :start_date, :end_date, :students, :system_checks, :postgrad_kickoff

    def initialize(title, start_date, end_date)
      @title = title
      @start_date = start_date
      @end_date = end_date
      @students = []
      @system_checks = []
      @postgrad_kickoff = @end_date + 4
    end


    def enroll(student_object)
        name_array =[]

        @students.each do |student|
            name_array << student.name
        end
        
        if !name_array.include?(student_object.name)
            @students << student_object
        end

    end

    def assign(system_check_object)
        sc_array =[]

        @system_checks.each do |sc|
            sc_array << sc.name
        end
        
        if !sc_array.include?(system_check_object.name)
            @system_checks << system_check_object
        end
    end 

    def roster
        string = "Cohort: #{title}\n------------"
        
        @students.each do |student|
            string += "#{student.name} #{student.email}\n"
        end
        string
    end

    def system_check_completed?(system_check_object)
        students_all = []
        students_submitted = []

        students.each do |student|
            students_all << student.name 
        end
        
        @system_checks.each do |system_check|
            if system_check.name == system_check_object.name
            system_check.submissions.each do |submission|
                students_submitted << submission.student.name
            end
        end
        end

        (students_submitted & students_all) == students_submitted ? true : false

    end


end
