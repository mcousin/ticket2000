require 'spec_helper'

describe "tickets/edit" do
  before(:each) do
    @ticket = assign(:ticket, stub_model(Ticket,
      :subject => "MyText",
      :status => "MyText",
      :description => "MyText"
    ))
  end

  it "renders the edit ticket form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => tickets_path(@ticket), :method => "post" do
      assert_select "textarea#ticket_subject", :name => "ticket[subject]"
      assert_select "textarea#ticket_status", :name => "ticket[status]"
      assert_select "textarea#ticket_description", :name => "ticket[description]"
    end
  end
end
