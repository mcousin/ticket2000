require 'spec_helper'

describe "tickets/index" do
  before(:each) do
    assign(:tickets, [
      stub_model(Ticket,
        :subject => "MyText",
        :status => "MyText",
        :description => "MyText"
      ),
      stub_model(Ticket,
        :subject => "MyText",
        :status => "MyText",
        :description => "MyText"
      )
    ])
  end

  it "renders a list of tickets" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 6
  end
end
