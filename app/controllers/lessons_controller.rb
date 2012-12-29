class LessonsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :correct_user,   only: [:show, :destory, :edit, :update]
  # GET /lessons
  # GET /lessons.json
  def index
    #@lessons = Lesson.all
    lessons_ordered = current_user.lessons.order("date DESC")
    @lessons = lessons_ordered.paginate(page: params[:page], :per_page => 10)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @lessons }
    end
  end

  # GET /lessons/1
  # GET /lessons/1.json
  def show
    @lesson = Lesson.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @lesson }
    end
  end

  # GET /lessons/new
  # GET /lessons/new.json
  def new
    @lesson = Lesson.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @lesson }
    end
  end

  # GET /lessons/1/edit
  def edit
    @lesson = Lesson.find(params[:id])
  end

  # POST /lessons
  # POST /lessons.json
  def create
    #@lesson = Lesson.new(params[:lesson])
    @lesson = current_user.lessons.build(params[:lesson])
    
    if params[:lesson]['wakeuptime(4i)'].blank?
      @lesson.wakeuptime = nil
    end
    
    if params[:lesson]['sleeptime(4i)'].blank?
      @lesson.sleeptime = nil
    end

    respond_to do |format|
      if @lesson.save
        format.html { redirect_to @lesson, notice: 'Lesson was successfully created.' }
        format.json { render json: @lesson, status: :created, location: @lesson }
      else
        format.html { render action: "new" }
        format.json { render json: @lesson.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /lessons/1
  # PUT /lessons/1.json
  def update
    @lesson = Lesson.find(params[:id])
    
    respond_to do |format|
      if @lesson.update_attributes(params[:lesson])
        
        if params[:lesson]['wakeuptime(4i)'].blank?
          @lesson.wakeuptime = nil
          if params[:lesson]['sleeptime(4i)'].blank?
            @lesson.sleeptime = nil
          end
          @lesson.save
        end
        
        format.html { redirect_to @lesson, notice: 'Lesson was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @lesson.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lessons/1
  # DELETE /lessons/1.json
  def destroy
    @lesson = Lesson.find(params[:id])
    @lesson.destroy

    respond_to do |format|
      format.html { redirect_to lessons_url }
      format.json { head :no_content }
    end
  end
  
private
    def correct_user
      lesson = Lesson.find(params[:id])
      redirect_to root_path, notice: "Yon can not access" unless current_user.id==lesson.user_id || current_user.admin?
      
    end
end
