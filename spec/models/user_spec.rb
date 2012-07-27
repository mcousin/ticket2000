require 'spec_helper'

describe "User with three tickets, one closed, two open" do
  let (:user) do
    user = User.new
    ticket1 = Ticket.new(:status => "open")
    ticket2 = Ticket.new(:status => "open")
    ticket3 = Ticket.new(:status => "closed")
    user.tickets << ticket1
    user.tickets << ticket2
    user.tickets << ticket3
    user    
  end
  
  it "counts the number of open tickets" do  
    user.open_ticket_count.should == 2
  end
  
  it "counts the number of closed tickets" do  
    user.closed_ticket_count.should == 1
  end
end
