require "spec_helper"

RSpec.describe Employee do
  let(:dixon) { Employee.new("Dixon Bainbridge", "Owner") }
  let(:clone_of_dixon) { Employee.new("The OTHER Dixon Bainbridge", "Clone (that does all of the work)") }

  describe ".new" do
    it "takes a name and title as arguments" do
      expect(dixon).to be_an(Employee)
    end
  end

  describe "#name" do
    it "has a reader for name" do
      expect(dixon.name).to eq("Dixon Bainbridge")
    end

    it "returns a value that is not hardcoded" do
      expect(clone_of_dixon.name).to eq("The OTHER Dixon Bainbridge")
    end
  end

  describe "#title" do
    it "has a reader for title" do
      expect(dixon.title).to eq("Owner")
    end

    it "returns a value that is not hardcoded" do
      expect(clone_of_dixon.title).to eq("Clone (that does all of the work)")
    end

    it "sets the default title to 'Zoo Keeper'" do
      naboo = Employee.new("Naboo")
      expect(naboo.title).to eq("Zoo Keeper")
    end
  end

  describe "#full_title" do
    it "returns the name and title of an employee" do
      expect(dixon.full_title).to eq("Dixon Bainbridge, Owner")
    end

    it "returns a value that is not hardcoded" do
      expect(clone_of_dixon.full_title).to eq("The OTHER Dixon Bainbridge, Clone (that does all of the work)")
    end
  end

  describe "#greet" do
    it "should be a string" do
      expect(dixon.greet).to be_a(String)
    end

    it "should greet the user and mention the name of the employee" do
      expect(dixon.greet).to eq("Dixon Bainbridge waved hello!")
    end

    it "returns a value that is not hardcoded" do
      expect(clone_of_dixon.greet).to eq("The OTHER Dixon Bainbridge waved hello!")
    end
  end
end
