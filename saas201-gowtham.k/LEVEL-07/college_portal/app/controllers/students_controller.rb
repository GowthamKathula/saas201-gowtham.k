class StudentsController < ApplicationController
	def index
		if params[:department_id]
      		@students = Student.where(section_id: params[:section_id]).all
    	else
      		@students = Student.all
      	end
	end
	def new
    	@student = Student.new
    	@section_collection = Section.all.collect { |p| [p.name, p.id] }
      @department_collection = Department.all.collect { |p| [p.name, p.id] }
  	end

  	def create
    	@student = Student.new(student_params)
    	if @student.save
      		redirect_to action: "index"
    	else
      		flash[:danger] = @student.errors.values.join(', ')
          redirect_to action: "new"
    	end
  	end
    def show
      @student=Student.find(params[:id])

    end

  	private

  	def student_params
    	params[:student].permit(:name, :section_id, :department_id,:email)
  	end
end
