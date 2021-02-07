class EmployeesController < ApplicationController
  def index
    @employee = Employee.all
  end

  def show
    @employee = Employee.find(params[:id])
  end

  def new

  end
end
