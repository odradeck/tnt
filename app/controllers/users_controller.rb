class UsersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :admin_user, only: [:set_admin, :unset_admin, :show, :index, :destory]
     
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json:  @user }
    end
  end
  
  
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
  end
  end
  
  def set_admin
    user = User.find(params[:id])
    user.admin = true
    user.save
    redirect_to user    
  end
  
  def unset_admin
    user = User.find(params[:id])
    user.admin = false
    user.save
    redirect_to user    
  end
  
   def destroy
    @user = TestModel.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_path }
      format.json { head :no_content }
    end
  end
  
  

  
private

        
    def correct_user
      @user = User.find(params[:id])
            
      #redirect_to(root_path) unless current_user?(@user)
      redirect_to root_path, notice: "Yon can not edit" unless current_user==@user || @user.admin?
      
    end
    
    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end
end
