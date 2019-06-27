class GradeEvaluationsController < ApplicationController
    
    def index
        @grade = GradeEvaluation.all
        @evaluation = Evaluation.find(params[:evaluation_id])
        
    end
    
    def new
        @grade = GradeEvaluation.new
        
    end
    def edit
        #debugger
        @grade = GradeEvaluation.find(params[:id])
    end
    def create
        #debugger
        @grade = GradeEvaluation.new(grade_evaluation_params)
        @student = student_user
        @evaluation = Evaluation.find(params[:evaluation_id])
        @student.grade_evaluations << @grade
        @grade.evaluation = @evaluation
        #@course = Course.find(params[:course_id])
        
        if @grade.save
            #@course.evaluations << @evaluation
            #@grade.evaluation = @evaluation
            #@grade.student = @student
            

            redirect_to evaluation_grade_evaluation_path(@evaluation,@grade)
        else
            render 'new'
        end
        
    end
    
    def show
    
    @grade = GradeEvaluation.find(params[:id])
    @evaluation = Evaluation.find(params[:evaluation_id])
    
        
    end

    def update
        
        @grade = GradeEvaluation.find(params[:id])
        @evaluation = Evaluation.find(params[:evaluation_id])
        #debugger
        if @grade.update(ugrade_evaluation_params)
            redirect_to evaluation_grade_evaluation_path(@evaluation,@grade)
        else
            render edit_evaluation_grade_evaluation_path(@evaluation,@grade)
        end
        
    end

    private 
    def grade_evaluation_params
        params.require(:grade_evaluation).permit(:attachment)   
        #params.require(:gradepermit(:attachment)
    end  
    
    def ugrade_evaluation_params
        params.require(:grade_evaluation).permit(:grade) 
        
    end
end
