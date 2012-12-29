class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.text :today
      t.text :tommorrow
      t.text :dummylog
      t.date :date
      t.time :wakeuptime
      t.time :sleeptime
      t.integer :workinghour
      t.integer :playinghour
      t.boolean :ex_running, :default=>false
      t.boolean :ex_upper, :default=>false
      t.boolean :ex_lower, :default=>false
      t.boolean :ex_mid, :default=>false
      t.integer :work_hardness
      t.integer :body_condition
      t.integer :mental_condition
      t.text :input
      t.text :output
      t.boolean :ex_streching
      t.integer :user_id

      t.timestamps
    end
  end
end
