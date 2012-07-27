class Comment < ActiveRecord::Base
  attr_accessible :comment_text, :ticket_id, :title
  
  belongs_to :ticket
end
