class SessionsController < ApplicationController
    def new
    end
    
    def create
      @user = User.find_by_email(params[:session][:email])
      if @user && @user.authenticate(params[:session][:password])
          
        session[:user_id] = @user.id
        
        if Student.find_by(:user_id => @user.id) != nil
            
           @algo = Student.where('user_id = @user.id')
           redirect_to student_path(@algo)
        else
            
           @algo =Tutor.where('user_id = @user.id')
            redirect_to tutor_path(@algo)    
            
        end
      else
        redirect_to 'login'
      end 
    end
    
    def destroy 
    session[:user_id] = nil 
    redirect_to '/' 
    end
end
