require_relative '../spec_helper'

describe Codegen do
  it "should generate the right number of codes using defaults" do
    cg = Codegen.new
    cg.length.should eql 22
  end

  it "should generate the right type of codes using defaults" do
    cg = Codegen.new
    cg.codes[0].should eql  [1,1,1,1,1,1,1,5]
    cg.codes[-1].should eql [1,1,1,1,5,5,5,5]
  end

  it "should work with empties" do
    cg = Codegen.new :empty_branches=>1
    cg.length.should eql 31
    cg.codes[0].should eql [0,1,1,1,1,1,1,6]
    
    cg = Codegen.new :empty_branches=>2
    cg.length.should eql 35
    cg.codes[0].should eql [0,0,1,1,1,1,1,1]
  end

  it "should work with bigger validation numbers" do
    cg = Codegen.new :validation_branch_leaves=>2
    cg.length.should eql 22
    cg.codes[0].should eql [1,1,1,1,2,2,2,2]
  end

  it "should work with fewer validation branches" do
    cg = Codegen.new :validation_branches=>2
    cg.length.should eql 78
    cg.codes[-1].should eql [1,1,5,5,6,6,6,6]
  end

  it "should work with a range of branches" do
    cg = Codegen.new :min_branches=>7, :max_branches=>8
    cg.length.should eql 31
    cg.codes[0].should eql  [1,1,1,1,1,1,6]
    cg.codes[-1].should eql [1,1,1,1,5,5,5,5]
  end

  it "should work with different max leaves" do
    cg = Codegen.new :max_leaves=>4
    cg.length.should eql 10
    cg.codes[0].should eql [1,1,1,1,1,1,1,1]
    cg = Codegen.new :max_leaves=>10
    cg.length.should eql 73
    cg.codes[0].should eql [1,1,1,1,1,1,1,3]
  end

  it "should work with different checksums" do
    cg = Codegen.new :checksum=>4
    cg.length.should eql 34
    cg.codes[0].should eql [1,1,1,1,1,1,1,1]
    cg = Codegen.new :checksum=>5
    cg.length.should eql 25
    cg.codes[0].should eql [1,1,1,1,1,1,1,3]
  end

end
