class ManagersController < ApplicationController
  def index
    @manager = Manager.all
  end

  def show
    @manager = Manager.includes(:employee).find(params[:id])
  end

  def new
    @manager = Manager.new
  end

  def create
    @manager = Manager.new(manager_params)

    if @manager.save
      redirect_to managers_path
    else
      render :new
    end
  end

  def destroy
    @manager = Manager.find(params[:id])

    if @manager.delete
      redirect_to managers_path
    else
      render :new
    end
  end

  private
    def manager_params
      params.require(:manager).permit(:name)
    end
end
