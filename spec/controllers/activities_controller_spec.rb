require 'spec_helper'

describe ActivitiesController do
	render_views
	
	describe "GET 'index'" do
	
		before(:each) do
			first = Factory(:activity, :name => "first")
			second = Factory(:activity, :name => "second")
			third = Factory(:activity, :name => "third")
			
			@activities = [first, second, third]
			
		end
		
		it "should be successful" do
			get :index
			response.should be_success
		end
		
		it "should have the right title" do
			get :index
			response.should have_selector("title", :content => "Activities")
		end
		
		it "should have an element for each activity" do
			get :index
			@activities.each do |activity|
				response.should have_selector("td", :content => activity.name)
			end
		end		
	end
	
	describe "GET 'show'" do
	
		before(:each) do
			@activity = Factory(:activity)
		end
		
		it "should be successful" do
			get :show, :id => @activity
			response.should be_success
		end
		
		it "should find the right activity" do
			get :show, :id => @activity
			assigns(:activity).should == @activity
		end
	end
	
	describe "POST 'create'" do
	
		describe "failure" do
			before(:each) do
				@attr = { :name => "" }
			end
		
			it "should not create an activity" do
				lambda do
					post :create, :activity => @attr
				end.should_not change(Activity, :count)
			end
		end
		
		describe "success" do
			before(:each) do
				@attr = {:name => "Test Case"}
			end
			
			it "should create a new activity" do
				lambda do
					post :create, :activity => @attr
				end.should change(Activity, :count).by(1)
			end
			
			it "should redirect to the activities page" do
				post :create, :activity => @attr
				response.should redirect_to(activities_path)
			end	
			
			it "should have a success message" do
				post :create, :activity => @attr
				flash[:success].should =~ /success/i
			end			
		end
	end	
end