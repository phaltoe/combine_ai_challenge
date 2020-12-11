class CreateRecords < ActiveRecord::Migration[6.1]
  def change
    create_table :records do |t|
      t.time :start_date
      t.time :end_date
      t.belongs_to :user
      t.belongs_to :meeting
      
      t.timestamps
    end
  end
end
