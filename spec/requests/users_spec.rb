require 'spec_helper'

describe "Users" do
  describe "signup" do

    describe "failure" do

      it "should not make a new user" do
				lambda do
					visit signup_path
					fill_in "First",         :with => ""
					fill_in "Display Name",        :with => ""
					fill_in "Email",				:with => ""
					fill_in "Company Domain",				:with => ""
					fill_in "Password",     :with => ""
					fill_in "Confirm Password", :with => ""
					click_button
					response.should render_template('users/new')
					response.should have_selector("div#error_explanation")
				end.should_not change(User, :count)
      end
		end
			
		describe "success" do

			it "should make a new user" do
				lambda do
					visit signup_path
					fill_in "First",         :with => "User"
					fill_in "Company Domain", :with => "example.com"
					fill_in "Email",        :with => "user@example.com"
					fill_in "Confirm email",        :with => "user@example.com"
					fill_in "Password",     :with => "foobar"
					fill_in "Confirm Password", :with => "foobar"
					fill_in "Display Name",	:with => "User"
					click_button
					response.should have_selector("div.flash.success",
																				:content => "Welcome")
					response.should render_template('users/show')
				end.should change(User, :count).by(1)
			end
		end
  end
end
