class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
    	t.text :description
    	t.string :event_type
    	t.datetime :date
    	t.integer :duration
    	t.string :host
    	t.string :location

      t.timestamps
    end
  end
end
