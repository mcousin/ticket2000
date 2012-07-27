class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :title
      t.text :comment_text
      t.integer :ticket_id

      t.timestamps
    end
  end
end
