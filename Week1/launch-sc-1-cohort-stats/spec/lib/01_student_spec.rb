require "spec_helper"

describe Student do
  describe ".new" do
    it "takes a name and email as arguments" do
      student = Student.new("Sam Seaborn", "sam.seaborn@gmail.com")

      expect(student).to be_a(Student)
    end
  end

  let(:student) { Student.new("Donna Moss", "donna.moss@gmail.com") }

  describe "#name" do
    it "returns the initialized name and is a string" do
      expect(student.name).to be_a(String)
      expect(student.name).to eq("Donna Moss")
    end

    it "cannot write the name attribute" do
      expect { student.name = "C. J. Cregg" }.to raise_error(NoMethodError)
    end
  end

  describe "#email" do
    it "returns the initialized email and is a string" do
      expect(student.email).to be_a(String)
      expect(student.email).to eq("donna.moss@gmail.com")
    end

    it "cannot write the email attribute" do
      expect { student.email = "dolores.landingham@gmail.com" }.to raise_error(NoMethodError)
    end
  end
end
