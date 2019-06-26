class InicioController < ApplicationController
  def index
    if student_user || tutor_user
      #debugger

        @user = User.find(session[:user_id])
        if student_user
          
          @objj = Student.where(user_id: @user.id).take
          @programs = @objj.programs
        
        elsif tutor_user
        
          #@objj = Tutor.where(user_id: @user.id).take
          @programs = Program.all
          
        end

        

        
      
      else
        
        @programs = Program.all
        
      end
  end
end
