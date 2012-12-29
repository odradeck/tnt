# coding : utf-8

class Lesson < ActiveRecord::Base
  attr_accessible :playinghour, :sleeptime, :user_id, :wakeuptime, :workinghour
  attr_accessible :date, :today, :tomorrow, :dummylog, :input, :output 
  attr_accessible :body_condition, :mental_condition, :work_hardness
  attr_accessible :ex_lower, :ex_mid, :ex_running, :ex_streching, :ex_upper

  belongs_to :user
  
  
  def str_ex
    exstr = String.new
    exstr = exstr + "달리기 " if self.ex_running
    exstr = exstr + "상체운동 " if self.ex_upper
    exstr = exstr + "하체운동 " if self.ex_lower
    exstr = exstr + "복부 " if self.ex_mid
    exstr = exstr + "스트레칭 " if self.ex_streching
    
    exstr
  end
  
  def str_body_condition
    case self.body_condition
      when 1
        "최악"
      when 2
        "별로에요"
      when 3
        "보통"
      when 4
        "좋아요"
      when 5
        "정말좋아요"
    end
  end
  
  def str_mental_condition
    case self.mental_condition
      when 1
        "최악"
      when 2
        "별로에요"
      when 3
        "보통"
      when 4
        "좋아요"
      when 5
        "정말좋아요"
    end
  end
  
  def str_work_hardness
    case self.work_hardness
      when 1
        "아주널널"
      when 2
        "널널"
      when 3
        "보통"
      when 4
        "빡심"
      when 5
        "아주빡심"
    end
  end
end
