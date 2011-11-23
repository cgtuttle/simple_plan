require 'spec_helper'

describe Activity do
	before(:each) do
		@attr = { :name => "Example Name" }
	end
	
	it "should create a new instance given valid attributes" do
		Activity.create!(@attr)
	end
	
	it "should require a name" do
		no_name_activity = Activity.new(:name => "")
		no_name_activity.should_not be_valid
	end
	
	it "should reject names that are too long" do
		long_name = "a" * 51
		long_name_act = Activity.new(@attr.merge(:name => long_name))
		long_name_act.should_not be_valid
	end
	
	it "should reject an activity with a duplicate name" do
		Activity.create!(@attr)
		act_with_duplicate_name = Activity.new(@attr)
		act_with_duplicate_name.should_not be_valid
	end
end
