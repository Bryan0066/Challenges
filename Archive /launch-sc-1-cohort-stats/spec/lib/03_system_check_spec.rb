require "spec_helper"

describe SystemCheck do
  describe ".new" do
    it "takes a name and due date as arguments" do
      due = Date.parse("2020/08/14")
      system_check = SystemCheck.new("Grocery List in Sinatra", due)

      expect(system_check).to be_a(SystemCheck)
    end
  end

  let(:system_check) do
    due = Date.parse("2020/08/21")
    SystemCheck.new("Grocery List with Fetch", due)
  end

  describe "#submissions" do
    it "is initialized as an empty array" do
      expect(system_check.submissions).to be_a(Array)
      expect(system_check.submissions).to eq([])
      expect(system_check.submissions.length).to eq(0)
    end

    it "cannot write the submissions attribute" do
      student = Student.new("Charles Thomas", "charles.thomas@gmail.com")
      solution = "POROS"
      new_submission = SystemCheckSubmission.new(solution, student)

      expect { system_check.submissions = [new_submission] }.to raise_error(NoMethodError)
    end

    it "returns an array of the submission made by all students" do
      student = Student.new("Jane Doe", "jane.doe@gmail.com")
      solution = "super advanced OOP"
      submission = SystemCheckSubmission.new(solution, student)

      system_check.add_submission(submission)
      # Note: you will need to consider the implementation of `#add_submission` in order to get these tests to pass

      expect(system_check.submissions).to include(submission)
    end
  end

  describe "#add_submission" do
    it "takes in a Submission object and stores it in @submissions" do
      student = Student.new("Toby Ziegler", "toby.ziegler@gmail.com")
      solution = "meets expectations solution"
      submission = SystemCheckSubmission.new(solution, student)

      system_check.add_submission(submission)

      expect(system_check.submissions).to include(submission)
    end
  end
end
