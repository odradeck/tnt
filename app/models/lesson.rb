class Lesson < ActiveRecord::Base
  attr_accessible :playinghour, :sleeptime, :user_id, :wakeuptime, :workinghour
  attr_accessible :date, :today, :tomorrow, :dummylog, :input, :output 
  attr_accessible :body_condition, :mental_condition, :work_hardness
  attr_accessible :ex_lower, :ex_mid, :ex_running, :ex_streching, :ex_upper

  belongs_to :user
  
end
