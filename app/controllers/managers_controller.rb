class ManagersController < ApplicationController
  before_action :set_manager, only: [ :show, :edit, :update, :destory ]

  def index
    @manager = Manager.all
  end

  def show
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

  def edit
  end

  def update
    if @manager.update(manager_params)
      redirect_to @manager
    else
      render :edit
    end
  end

  def destroy
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

    def set_manager
      @manager = Manager.find_by(id: params[:id])
    end
end
