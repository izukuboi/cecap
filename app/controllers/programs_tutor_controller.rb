class ProgramsTutorController < ApplicationController
    def index
        @tutors = Tutor.all
        @program = Program.find(params[:program_id])
    end
    
    def create
        #debugger
        @program = Program.find(params[:program_id])
        @tutor = Tutor.find(params[:tutor_id])
        
        @tutor.programs << @program
        redirect_to program_path(@program)
        
        
    end
end
