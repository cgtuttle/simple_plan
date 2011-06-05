require 'spec_helper'

describe "domains/edit.html.erb" do
  before(:each) do
    @domain = assign(:domain, stub_model(Domain,
      :domain => "MyString",
      :name => "MyString",
      :class_id => 1
    ))
  end

  it "renders the edit domain form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => domains_path(@domain), :method => "post" do
      assert_select "input#domain_domain", :name => "domain[domain]"
      assert_select "input#domain_name", :name => "domain[name]"
      assert_select "input#domain_class_id", :name => "domain[class_id]"
    end
  end
end
