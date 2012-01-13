require 'spec_helper'

describe BudgetsController do

  describe "GET 'index'" do
    it "should be successful" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'edit'" do
    it "should be successful" do
      get 'edit'
      response.should be_success
    end
  end

  describe "GET '_new'" do
    it "should be successful" do
      get '_new'
      response.should be_success
    end
  end

end
