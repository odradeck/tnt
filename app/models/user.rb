class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable :validatable
  devise :database_authenticatable, :registerable, :validatable,
         :recoverable, :rememberable, :trackable, :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :password, :password_confirmation, :current_password
  attr_accessible :email, :password, :password_confirmation, :remember_me, :current_password
  attr_accessible :uid, :name, :phone
  
  #for Oauth
  has_many :services, :dependent => :destroy
  
  has_many :lessons
  
  def last_lesson
    @ll ||= self.lessons.order("date DESC").first
    @ll
  end
  
  
end
