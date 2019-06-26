class TutorsController < ApplicationController
    before_action :require_user, only: [:show]
    
  #  def index
   #     @tutors = Tutor.all
    #    @program = Program.find(params[:program_id])
        
    #end
    
    def new
        
        @tutor = Tutor.new
        @tutor.user = User.new
        
    end
    
    def edit
        #@tutor = Tutor.joins(:user).where('user_id = params[:id]').model
        @tutor = Tutor.where(user_id: params[:id]).take
    end
    
    def create
        @tutor = Tutor.new()
        @tutor.create_user(user_params)
        #@user = User.new(user_params)
        
        
        if @tutor.save
            #@tutor.save
            session[:user_id] = @tutor_id
            redirect_to '/'
        else
            redirect_to '/tutors/new'
            
        end
    end
    
    def update
        @tutor = Tutor.find_by(user_id: params[:id])
        @us = User.find(params[:id])
        
        #@b = Student.new
        #@a = @b.create_user(user_params)
        #@student.user.update(user_params)
        #@student.user = @us
        if @us.update(user_params)
            
            redirect_to tutor_path(@tutor)  
        else
            render 'edit'
        end
    end
    
    
    def show
        #@tutor = Tutor.joins(:user).where('user_id = session[:user_id]')
        @tutor = Tutor.where(user_id: session[:user_id]).take
    end    

    private
        def user_params
            params.permit(:nombre, :apellidop ,:apellidom,  :email , :numeroTelf , :password)
        end  
end
