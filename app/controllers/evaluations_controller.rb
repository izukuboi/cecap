class EvaluationsController < ApplicationController
    def new
        @evaluation = Evaluation.new()
    end
    def edit
        @evaluation = Evaluation.find(params[:id])
    end
    
    def create
        #debugger
        @evaluation = Evaluation.new(evaluation_params)
        @course = Course.find(params[:course_id])
        if @evaluation.save
            @course.evaluations << @evaluation
            redirect_to course_evaluation_path(@course,@evaluation), notice: "The evaluation #{@evaluation.title} has been uploaded."
        else
            render 'new'
        end
        
    end
    
    def show
        
        #debugger
        @evaluation = Evaluation.find(params[:id])
        if student_user
            @gradenota = GradeEvaluation.where(:evaluation_id => @evaluation.id, :student_id => student_user.id).take
        end
        
        @course = Course.find(params[:course_id])
        

        #@grade = GradeEvaluation.new
        #@programa = @course.program
        #
        #@gradenota = student_user.grade_evaluations.where(:evaluation_id => @evaluation.id, :student_id => student_user.id).last
        #@nais = User.all
        
    end
    
    def update
        @course = Course.find(params[:course_id])
        @evaluation = Evaluation.find(params[:id])
        #debugger
        if @evaluation.update(uevaluation_params)
            redirect_to course_evaluation_path(@course,@evaluation)
        else
            render edit_course_evaluation_path(@course,@evaluation)
        end
        
    end
    
    def destroy
        #debugger
        @course = Course.find(params[:course_id])
        @evaluation = Evaluation.find(params[:id])
        @evaluation.destroy
        redirect_to @course, notice:  "The evaluation #{@evaluation.title} has been deleted."
    end
    
    def uploadf
        #debugger
        @course = Course.find(params[:course_id])
        @evaluation = Evaluation.find(params[:evaluation_id])
        if @evaluation.update(params.permit(:attachment_upload))
            redirect_to course_evaluation_path(@course,@evaluation)
        end
    
    end
    
    
    private
        def evaluation_params
            
            params.permit(:title,:content,:attachment,:course_id)
        end  
        
        def uevaluation_params
            params.require(:evaluation).permit(:title,:content,:attachment)
            
        end
end
