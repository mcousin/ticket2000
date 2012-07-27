class Ticket < ActiveRecord::Base
  attr_accessible :description, :status, :subject, :user_id
  
  validates_presence_of   :subject
  validates_presence_of   :status
  validates_presence_of   :description
  
  belongs_to :user
  has_and_belongs_to_many :tags 
  has_many :comments
  
  before_update :update_tag
  
  scope :open, where(:status => "open")
  
  private
  
  def update_tag
    new_changes = self.changes
    if (new_changes["status"])
      actual_changes = changes["status"]
      comment = Comment.new
      comment.comment_text = "Status changed from #{actual_changes.first} to #{actual_changes.last}."
      comment.title = "UPDATED!"
      comment.ticket = self
      comment.save!
    end
  end
  
end
