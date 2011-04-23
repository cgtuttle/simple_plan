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
				response.should have_selector("li", :content => activity.name)
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

	describe "GET 'new'" do
		it "should be successful" do
			get 'new'
			response.should be_success
		end
		
		it "should have the right title" do
			get :new
			response.should have_selector("title", :content => "New Activity")
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
			
			it "should have the right title" do
				post :create, :activity => @attr
				response.should have_selector("title", :content => "New Activity")
      end
			
			it "should render the 'new' page" do
        post :create, :user => @attr
        response.should render_template('new')
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
			
			it "should redirect to the activity show page" do
				post :create, :activity => @attr
				response.should redirect_to(activity_path(assigns(:activity)))
			end	
			
			it "should have a success message" do
				post :create, :activity => @attr
				flash[:success].should =~ /success/i
			end			
		end
	end	
end