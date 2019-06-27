class ProgramsController < ApplicationController
    before_action :require_admin, only: [:edit]

    
    def index
        @programs = Program.all    
    end
    
    def edit
        @program = Program.find(params[:id])
    end
    
    def new
        @program =  Program.new()
    end
    def create
        #ebugger
        
        @program = Program.new(program_params)
        
        if @program.save()
            redirect_to @program
        else
            render 'new'
        end       
    end
    def update
      @program = Program.find(params[:id])
     
      if @program.update(program_params)
        redirect_to @program
      else
        render 'edit'
      end
    end
    def show
        @program = Program.find(params[:id])
    end
    
    def destroy
        @program = Program.find(params[:id])
        @program.destroy
 
        redirect_to programs_path
    end
    def subscribe
        @program = Program.find(params[:program_id])
        @user = User.find(session[:user_id])
        @student = Student.where(user_id: @user.id).take
        
        if @program.students.where(id: @student.id).take == nil
            #@program.students.find(@student.id) == nil
            #debugger
            @program.students << @student
            #@student.programs << @program
            
            @program.save
            redirect_to program_path(@program) , notice: "Subscripcion exitosa"
        else
            #debugger
            #flash.now[:alert] = "Ya estas subscrito"
            redirect_to @program, danger: "Ya estas subscrito"
        end
        
    
        
    end
    
    private
        def program_params
            params.require(:program).permit(:nombrePrograma,:NumModulo,:description)
        end  
end
