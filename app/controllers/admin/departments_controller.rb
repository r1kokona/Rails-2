class Admin::DepartmentsController < ApplicationController
    def index
        @departments = Department.all
    end
    def show
        @department = Department.find(params[:id])
    end
    def new
        @department = Department.new
    end
    def create
        @department = Department.new(department_params)
        if @department.save
            redirect_to admin_department_path(@department)
        else
            render :new, status: :unprocessable_entity
        end
    end
    def edit
        @department = Department.find(params[:id])
    end
    def update
        @department = Department.find(params[:id])
    
        if @department.update(department_params)
            redirect_to admin_department_path(@department)
        else
            render :edit, status: :unprocessable_entity
        end
    end
    def destroy
        @department = Department.find(params[:id])
        @department.destroy
        redirect_to admin_departments_path, status: :see_other
    end
    private
    def department_params
        params.require(:department).permit(:department_name)
    end
end
