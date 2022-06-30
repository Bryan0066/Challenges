require "spec_helper"

RSpec.describe Python do
  let(:python) { Python.new("Long Mover") }
  let(:solid_snake) { Python.new("Solid Snake") }

  describe ".new" do
    it "take a name as an argument" do
      expect(python).to be_a(Python)
    end
  end

  describe "#name" do
    it "has a reader for name" do
      expect(python.name).to eq("Long Mover")
    end
    
    it "ensures you haven't hardcoded the name" do 
      expect(solid_snake.name).to eq("Solid Snake")
    end
  end

  describe "#shed_count" do
    it "is a reader that returns a default shed count of 0, recording the number of times a snake has shed its skin" do 
      expect(python.shed_count).to eq(0)
    end
  end

  describe "#speak" do
    it "says what all snakes say" do
      expect(python.speak).to eq("SSSSssssss...")
    end
  end

  describe "#shed" do 
    it "increases the snake's shed count by 1" do 
      python.shed
      expect(python.shed_count).to eq(1)
    end
    
    it "returns a descriptive message about the snake's shedding habits" do 
      expect(python.shed).to eq("Long Mover has been reborn. Number of times shedded: 1")
    end

    it "also ensures you haven't hardcoded the string" do 
      solid_snake.shed
      expect(solid_snake.shed).to eq("Solid Snake has been reborn. Number of times shedded: 2")
    end
  end
end

  