class EmployeesController < ApplicationController
  def index
    @employee = Employee.all
  end

  def new

  end
end
