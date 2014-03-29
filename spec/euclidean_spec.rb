require 'measurable/euclidean_c'

describe "Euclidean" do

  before :all do
    @u = [1, 3, 16]
    @v = [1, 4, 16]
    @w = [4, 5, 6]
  end

  shared_examples_for "Distance" do
    it "accepts two arguments" do
      expect { Measurable.send(distance, @u, @v) }.to_not raise_error
      expect { Measurable.send(distance, @u, @v, @w) }.to raise_error(ArgumentError)
    end

    it "accepts one argument and returns the vector's norm" do
      # Remember that 3^2 + 4^2 = 5^2.
      Measurable.send(distance, [3, 4]).should == 5
    end

    it "should be symmetric" do
      Measurable.send(distance, @u, @v).should == Measurable.send(distance, @v, @u)
    end

    it "should return the correct value" do
      Measurable.send(distance, @u, @u).should == 0
      Measurable.send(distance, @u, @v).should == 1
    end

    it "shouldn't work with vectors of different length" do
      expect { Measurable.send(distance, @u, [2, 2, 2, 2]) }.to raise_error(ArgumentError)
    end
  end

  shared_examples_for "Squared Distance" do
    it "accepts two arguments" do
      expect { Measurable.euclidean_squared(@u, @v) }.to_not raise_error
      expect { Measurable.euclidean_squared(@u, @v, @w) }.to raise_error(ArgumentError)
    end

    it "accepts one argument and returns the vector's norm" do
      # Remember that 3^2 + 4^2 = 5^2.
      Measurable.euclidean_squared([3, 4]).should == 25
    end

    it "should be symmetric" do
      x = Measurable.euclidean_squared(@u, @v)
      y = Measurable.euclidean_squared(@v, @u)

      x.should == y
    end

    it "should return the correct value" do
      Measurable.euclidean_squared(@u, @u).should == 0
      Measurable.euclidean_squared(@u, @v).should == 1
    end

    it "shouldn't work with vectors of different length" do
      expect { Measurable.euclidean_squared(@u, [2, 2, 2, 2]) }.to raise_error(ArgumentError)
    end
  end

  context "euclidean" do
    let(:distance) { :euclidean }

    it_should_behave_like "Distance"
  end

  context "euclidean_c" do
    let(:distance) { :euclidean_c }

    it_should_behave_like "Distance"
  end
end
