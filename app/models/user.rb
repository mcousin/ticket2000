class User < ActiveRecord::Base
  
  has_many :tickets
  
  validates_presence_of   :last_name
  validates_presence_of   :first_name
  validates_presence_of   :email
  validates_uniqueness_of :email

  attr_accessible :email, :first_name, :last_name  
  
  has_secure_password
  
  def open_ticket_count
    
    openTickets = 0
    closedTickets = 0
    
    self.tickets.each do |e|
      if e.status == "open"
        openTickets += 1
      elsif e.status == "closed"
        closedTickets += 1
      end
    end
    
    self.tickets.select {|t| t.status =="open"}.size
  
  end
  
  def closed_ticket_count
    self.tickets.select{|t| t.status == "closed"}.size
  end
  
  def to_s
    return self.last_name
  end
end
