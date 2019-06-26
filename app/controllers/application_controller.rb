class ApplicationController < ActionController::Base
helper_method :current_user 
helper_method :admin
helper_method :tutor_user
helper_method :student_user
helper_method :subscribed



add_flash_types  :danger, :error

    def current_user 
        #debugger
        @current_user ||= User.find(session[:user_id]) if session[:user_id] 
    end
    
    def admin
        #debugger
        @aaa = User.where(email: 'admin@gmail.com').take 
        if @aaa != nil
             @admin ||= @aaa if session[:user_id] == @aaa.id
        end
        
    end
    
    def require_user 
        redirect_to '/login' unless current_user 
    end
    
    def require_admin
        redirect_to '/login' unless admin 
    end
    
    def tutor_user
        @tutor_user ||= Tutor.where(user_id: session[:user_id]).take if current_user
    end
    
    def student_user
        @student_user ||= Student.where(user_id: session[:user_id]).take if current_user
    end
    
    def subscribed
        #debugger
        if current_user
            @program = Program.find(params[:id])
            @student = student_user
            if @program.students.where(id: @student.id).take != nil
                @subscribed = true
            else
                @subscribed = false
            end
        else
            @subscribed = false
            
        end
                
            
        
    end

end
