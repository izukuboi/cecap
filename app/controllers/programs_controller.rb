class ProgramsController < ApplicationController
    before_action :require_admin, only: [:edit, :index]
    
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
    
    private
        def program_params
            params.require(:program).permit(:nombrePrograma,:NumModulo,:description)
        end  
end
