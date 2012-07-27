require 'spec_helper'

describe "comments/edit" do
  before(:each) do
    @comment = assign(:comment, stub_model(Comment,
      :title => "MyString",
      :comment_text => "MyText",
      :ticket_id => 1
    ))
  end

  it "renders the edit comment form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => comments_path(@comment), :method => "post" do
      assert_select "input#comment_title", :name => "comment[title]"
      assert_select "textarea#comment_comment_text", :name => "comment[comment_text]"
      assert_select "input#comment_ticket_id", :name => "comment[ticket_id]"
    end
  end
end
