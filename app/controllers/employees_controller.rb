class EmployeesController < ApplicationController
  before_action :set_employee, only: [ :show, :edit, :update, :destory ]

  def index
    @employee = Employee.all
  end

  def show
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

  def edit
  end

  def update
    if @employee.update(employee_params)
      redirect_to @employee
    else
      render :edit
    end
  end

  def destroy
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

    def set_employee
      @employee = Employee.find_by(id: params[:id])
    end
end
