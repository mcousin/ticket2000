require 'spec_helper'

describe Ticket do
#  let (:ticket) {Ticket.create(:status => "open", :subject => "asd", :description => "asdfa")}
  
  it "counts the number of comments" do
    ticket = Ticket.create(:status => "open", :subject => "asd", :description => "asdfa")        
    expect {
      ticket.status = "closed"
      ticket.save
      ticket.reload
    }.to change(ticket.comments, :count).by(1)
  end
  
  it "includes the changes in the comment" do
    ticket = Ticket.create(:status => "open", :subject => "asd", :description => "asdfa")        
    ticket.status ="closed"
    ticket.save
    comment = ticket.comments.last
    comment.comment_text.should == "Status changed from open to closed."
  end
end
