require "spec_helper"

describe SystemCheckSubmission do
  describe ".new" do
    it "takes a solution and student as arguments" do
      solution = "meets expectations solution"
      student = Student.new("Donna Moss", "donna.moss@gmail.com")
      submission = SystemCheckSubmission.new(solution, student)

      expect(submission).to be_a(SystemCheckSubmission)
    end
  end

  let(:submission) do
    student = Student.new("Donna Moss", "donna.moss@gmail.com")
    SystemCheckSubmission.new("awesome solution", student)
  end

  describe "#solution" do
    it "returns the initialized solution and is a string" do
      expect(submission.solution).to be_a(String)
      expect(submission.solution).to eq("awesome solution")
    end

    it "returns a value that is not hard-coded" do
      student = Student.new("Charlie Young", "charlie.young@gmail.com")
      other_submission = SystemCheckSubmission.new("terrible solution", student)

      expect(other_submission.solution).to eq("terrible solution")
    end

    it "cannot write the solution attribute" do
      expect { submission.solution = "nil" }.to raise_error(NoMethodError)
    end
  end

  describe "#student" do
    it "returns the initialized student and is a Student object" do
      expect(submission.student).to be_a(Student)
    end

    it "cannot write the student attribute" do
      expect { submission.student = nil }.to raise_error(NoMethodError)
    end
  end
end
