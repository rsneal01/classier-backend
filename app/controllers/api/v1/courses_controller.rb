class Api::V1::CoursesController < ApplicationController

    # before_action :set_teacher

    def index
        @courses = Course.all
        render json: @courses
    end

    def show
        @course = Course.find(params[:id])
    end

    def create
        @course = @teacher.courses.new(course_params)
        if @course.save
            render json: @teacher
        else
            render json: {error: 'Error creating course'}
        end
    end

    def destroy
        @course = Course.find(params[:id])
        @course.destroy
    end

    private

    def set_teacher
        @teacher = Teacher.find(params[:teacher_id])
    end

    def course_params
        params.require(:course).permit(:title, :teacher_id, :body, :description)
    end

end
