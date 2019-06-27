class CoursesController < ApplicationController
  def index
    #@course = Course.where(params[:id])
    #@program = Program.find(params[:id])
    @program = Program.find(params[:program_id])
  end

  def new
    #debugger
    @program = Program.find(params[:program_id])
    @course = Course.new
    @tutors = Tutor.all
  
    #@program.courses << @course
  end

  def create
    #debugger
    @course = Course.new(course_params)
    @program = Program.find(params[:program_id])
    
    if @course.save
       
       redirect_to program_courses_path(@program), notice: "The course #{@course.name} has been uploaded."
    else
       render "new"
    end
  end
  def show
    debugger
    
    @course = Course.find(params[:id])
    @evaluations = @course.evaluations
    @practices = @course.practices
    @materials = @course.materials
    
    #@lala = @evaluations.where(evatype: "exam").or(@evaluations.where(evatype: "practice"))
    #@exams = Evaluation.where(evatype: "exam")
    #practice = Evaluation.where(evatype: "practice")
    #@documents = @evaluations.where(evatype: "document")
  end

  def destroy
    @course = Course.find(params[:id])
    @program = @course.program
    @course.destroy
    redirect_to program_courses_path(@program), notice:  "The course #{@course.name} has been deleted."
  end
  
   private
      def course_params
      params.permit(:name, :descripton, :program_id, :tutor_id)
      end
end
