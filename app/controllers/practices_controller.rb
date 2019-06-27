class PracticesController < ApplicationController
    def new
        @practice = Practice.new()
    end
    def edit
        @practice = Practice.find(params[:id])
    end
    
    def create
        
        @practice = Practice.new(practice_params)
        @course = Course.find(params[:course_id])
        if @practice.save
            @course.practices << @practice
            redirect_to course_practice_path(@course,@practice), notice: "The practice #{@practice.title} has been uploaded."
        else
            render 'new'
        end
        
    end
    
    def show
        #debugger
        @practice = Practice.find(params[:id])
        @course = Course.find(params[:course_id])
        if student_user
            @gradenota = GradePractice.where(:practice_id => @practice.id, :student_id => student_user.id).take
        end
        #@grade = GradePractice.new
        #@gradenota = GradePractice.where(:practice_id => @practice.id).last
        #@gradenota = student_user.grade_practices.where(:practice_id => @practice.id, :student_id => student_user.id).last
    end
    
    def update
        @course = Course.find(params[:course_id])
        @practice = Practice.find(params[:id])
        #debugger
        if @practice.update(upractice_params)
            redirect_to course_practice_path(@course,@practice)
        else
            render edit_course_practice_path(@course,@practice)
        end
        
    end
    
    def destroy
        #debugger
        @course = Course.find(params[:course_id])
        @practice = Practice.find(params[:id])
        @practice.destroy
        redirect_to @course, notice:  "The practice #{@practice.title} has been deleted."
    end
    
    def uploadf
        #debugger
        @course = Course.find(params[:course_id])
        @practice = Practice.find(params[:practice_id])
        if @practice.update(params.permit(:attachment_upload))
            redirect_to course_practice_path(@course,@practice)
        end
    
    end
    
    
    private
        def practice_params
            
            params.permit(:title,:content,:attachment,:course_id)
        end  
        
        def upractice_params
            params.require(:practice).permit(:title,:content,:attachment)
            
        end
end
