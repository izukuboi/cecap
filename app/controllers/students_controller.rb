class StudentsController < ApplicationController
    before_action :require_user, only: [:show]
    def new
        
        @student = Student.new
        @student.user = User.new
        
    end
    def edit
        #@student = Student.joins(:user).where('user_id = params[:id]').model
        @student = Student.where(user_id: params[:id]).take
    end
    def create
        @student = Student.new()
        @student.create_user(user_params)
        #@user = User.new(user_params)
        
        
        if @student.save
            #@tutor.save
            session[:user_id] = @student_id
            redirect_to '/'
        else
            redirect_to '/studens/new'
        end
    end
    
    def update
        @student = Student.find_by(user_id: params[:id])
        @us = User.find(params[:id])
        
        #@b = Student.new
        #@a = @b.create_user(user_params)
        #@student.user.update(user_params)
        #@student.user = @us
        if @us.update(user_params)
            
            redirect_to student_path(@student)  
        else
            render 'edit'
        end
    end
    
    def show
        #@student = Student.joins(:user).where('user_id = session[:user_id]')
        @student = Student.where(user_id: session[:user_id]).take
    end
    
    private
        def user_params
            params.permit(:nombre, :apellidop ,:apellidom,  :email , :numeroTelf , :password)
        end  
end
