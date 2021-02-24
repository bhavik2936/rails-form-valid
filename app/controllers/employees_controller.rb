class EmployeesController < ApplicationController
  def index
    @employee = Employee.all
  end

  def show
    @employee = Employee.includes(:manager).find(params[:id])
  end

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.new(employee_params)

    if @employee.save
      redirect_to employees_path
    else
      render :new
    end
  end

  def destroy
    @employee = Employee.find(params[:id])

    if @employee.delete
      redirect_to employees_path
    else
      render :show
    end
  end

  private
    def employee_params
      params.require(:employee).permit(:name, :email, :dob, :mobile, :designation, :salary, :manager_id)
    end
end
