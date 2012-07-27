require "spec_helper"

describe "sessions/new" do

  it "displays login" do
    render
    rendered.should match("Login")
  end

  it "has a form" do
    render
    assert_select "form"
  end  
  
  it "has an email field" do
    render
    assert_select "input[name='user[email]']"
  end
  
  it "has a password field" do
    render
    assert_select "input[name='user[password]']"
  end
  
end