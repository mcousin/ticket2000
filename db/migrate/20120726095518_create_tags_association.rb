class CreateTagsAssociation < ActiveRecord::Migration

  def change
    create_table :tags_tickets, :id => false do |t|
      t.integer :tag_id
      t.integer :ticket_id
    end
  end
  
  def up
  end

  def down
  end
end
