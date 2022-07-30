require "spec_helper"

RSpec.describe Gorilla do
  let(:gorilla) { Gorilla.new("Bollo") }
  let(:koko) { Gorilla.new("Koko") }

  describe ".new" do
    it "take a name as an argument" do
      expect(gorilla).to be_a(Gorilla)
    end
  end

  describe "#name" do
    it "has a reader for name that returns the name property" do
      expect(gorilla.name).to eq("Bollo")
    end

    it "returns a value that is not hardcoded" do
      expect(koko.name).to eq("Koko")
    end
  end

  describe "#speak" do
    it "says Bollo's catch phrase while mentioning the gorilla's name" do
      expect(gorilla.speak).to eq("Bollo got a bad feeling about this...")
    end

    it "returns a value that is not hardcoded" do
      expect(koko.speak).to eq("Koko got a bad feeling about this...")
    end
  end
end
