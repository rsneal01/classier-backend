class Api::V1::CoursesController < ApplicationController

    # before_action :set_teacher

    def index
        @courses = Course.all
        render json: @courses
    end

    def show
        @course = Course.find(params[:id])
        render json: @course
    end

    def create
        # binding.pry
        @teacher = Teacher.find_by(id: params[:teacher_id])
        @course = @teacher.courses.create(course_params)
        # @course = Course.create(course_params)
        if @course.save
            
            render json: @teacher
        else
            render json: {error: 'Error creating course'}
        end
    end

    def destroy
        @course = Course.find(params[:id])
        @teacher = Teacher.find(@course.teacher_id)
        @course.destroy
        render json: @teacher
    end

    private

    def set_teacher
        @teacher = Teacher.find(params[:teacher_id])
    end

    def course_params
        params.require(:course).permit(:title, :teacher_id, :body, :description)
    end

end
