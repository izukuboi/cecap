class GradePracticesController < ApplicationController
    def new
        @grade = GradePractice.new
        
    end
    def create
        #debugger
        @grade = GradePractice.new(grade_evaluation_params)
        @student = student_user
        @practice = Practice.find(params[:practice_id])
        @student.grade_practices << @grade
        @grade.practice = @practice
        #@course = Course.find(params[:course_id])
        
        if @grade.save
            #@course.evaluations << @evaluation
            #@grade.evaluation = @evaluation
            #@grade.student = @student
            

            redirect_to practice_grade_practice_path(@practice,@grade)
        else
            render 'new'
        end
        
    end
    
    def show
    
    @grade = GradePractice.find(params[:id])
    @practice = Practice.find(params[:practice_id])
    
        
    end

    private 
    def grade_evaluation_params
        params.require(:grade_practice).permit(:attachment)   
        #params.require(:gradepermit(:attachment)
    end  
end
