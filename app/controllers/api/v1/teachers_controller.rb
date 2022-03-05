class Api::V1::TeachersController < ApplicationController

    def index
        @teachers = Teacher.all
        render json: @teachers
    end

    def create
        @teacher = Teacher.create(teacher_params)
        if @teacher.save
            render json: @teacher
        else
            render json: {error: 'Error creating teacher'}
        end
    end

    def show
        @teacher = Teacher.find(params[:id])
    end

    def destroy
        @teacher = Teacher.find(params[:id])
        @teacher.destroy
    end

    private

    def teacher_params
        params.require(:teacher).permit(:name)
    end
end
