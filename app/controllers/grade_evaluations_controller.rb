class GradeEvaluationsController < ApplicationController
    def new
        @grade = GradeEvaluation.new
        
    end
    def create
        debugger
        @grade = GradeEvaluation.new(grade_evaluation_params)
        @student = student_user
        @evaluation = Evaluation.find(params[:evaluation_id])
        #@course = Course.find(params[:course_id])
        if @grade.save
            #@course.evaluations << @evaluation
            @grade.evaluation = @evaluation
            @grade.student = @student
            

            redirect_to evaluation_grade_evaluation_path(@evaluation,@grade)
        else
            render 'new'
        end
        
    end

    private 
    def grade_evaluation_params
            
        params.permit(:attachment)
    end  
end
