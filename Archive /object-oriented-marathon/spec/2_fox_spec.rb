require "spec_helper"

RSpec.describe Fox do
  let(:fox) { Fox.new("Jack") }

  describe ".new" do
    it "take a name as an argument" do
      expect(fox).to be_a(Fox)
    end
  end

  describe "#name" do
    it "has a reader for name that returns the name property" do
      expect(fox.name).to eq("Jack")
    end

    it "returns a value that is not hardcoded" do
      jill = Fox.new("Jill")
      expect(jill.name).to eq("Jill")
    end
  end

  describe "#speak" do
    it "says what all foxes DEFINIETLY say now, after the internet phenomenon was released" do
      expect(fox.speak).to eq("Ring-ding-ding-ding-dingeringeding!")
    end
  end
end
