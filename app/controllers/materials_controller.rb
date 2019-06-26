class MaterialsController < ApplicationController
    def new
        @material = Material.new()
    end
    def edit
        @material = Material.find(params[:id])
    end
    
    def create
        
        @material = Material.new(material_params)
        @course = Course.find(params[:course_id])
        if @material.save
            @course.materials << @material
            redirect_to course_material_path(@course,@material), notice: "The material #{@material.title} has been uploaded."
        else
            render 'new'
        end
        
    end
    
    def show
        
        @material = Material.find(params[:id])
        @course = Course.find(params[:course_id])
    end
    
    def update
        @course = Course.find(params[:course_id])
        @material = Material.find(params[:id])
        #debugger
        if @material.update(umaterial_params)
            redirect_to course_material_path(@course,@material)
        else
            render edit_course_material_path(@course,@material)
        end
        
    end
    
    def destroy
        #debugger
        @course = Course.find(params[:course_id])
        @material = Material.find(params[:id])
        @material.destroy
        redirect_to @course, notice:  "The material #{@material.title} has been deleted."
    end
    
    def uploadf
        #debugger
        @course = Course.find(params[:course_id])
        @material = Material.find(params[:material_id])
        if @material.update(params.permit(:attachment_upload))
            redirect_to course_material_path(@course,@material)
        end
    
    end
    
    
    private
        def material_params
            
            params.permit(:title,:content,:attachment,:course_id)
        end  
        
        def umaterial_params
            params.require(:material).permit(:title,:content,:attachment)
            
        end
end
