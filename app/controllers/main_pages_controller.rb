class MainPagesController < ApplicationController
  def home
    @lessons = Lesson.paginate(:page =>params[:page], :per_page => 3).order('date DESC')

  end

  def about
  end

  def help
  end

  def terms
  end
  
  def others
    #lessons = Lesson.all
    #lessons_ordered = Lesson.find(:all, :order => "date DESC")
    @lessons = Lesson.paginate(:page =>params[:page], :per_page => 20).order('date DESC')
    #lessons_ordered = lessons.order("date DESC")
    #lessons_ordered = current_user.lessons.order("date DESC")
    #@lessons = lessons_ordered.paginate(page: params[:page], :per_page => 20)
  end
end
