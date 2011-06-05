require 'spec_helper'

describe "domains/show.html.erb" do
  before(:each) do
    @domain = assign(:domain, stub_model(Domain,
      :domain => "Domain",
      :name => "Name",
      :class_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Domain/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
