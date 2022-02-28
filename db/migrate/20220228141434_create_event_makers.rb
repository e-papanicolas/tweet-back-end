class CreateEventMakers < ActiveRecord::Migration[7.0]
  def change
    create_table :event_makers do |t|

      t.timestamps
    end
  end
end
