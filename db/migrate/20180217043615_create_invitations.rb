class CreateInvitations < ActiveRecord::Migration[5.0]
  def change
    create_table :invitations do |t|
    	t.integer :user_id
    	t.integer :event_id
    	t.boolean :confirmed
    	t.boolean :interested

      	t.timestamps
    end
  end
end
