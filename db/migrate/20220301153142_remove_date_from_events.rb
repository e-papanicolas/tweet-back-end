class RemoveDateFromEvents < ActiveRecord::Migration[7.0]
  def change
    remove_column :events, :date 
    add_column :events, :timeout, :integer
  end
end
