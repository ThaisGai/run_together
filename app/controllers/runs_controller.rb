class RunsController < ApplicationController

  def index
    @run = Run.all
  end
  def show
    @run = Run.find(params[:id])
  end

  def new
    @run = Run.new
  end

  def create
    @run = Run.new(run_params)
    @run.user = current_user
    if @run.save
      redirect_to @run
    else
      render "new", status: :unprocessable_entity
    end
  end

  def edit
    authorize @run
    @run = Run.find(params[:id])
  end

  def update
    authorize @run
    @run.update(run_params)
    redirect_to run_path
  end

  def destroy
    @run = Run.find(params[:id])
    authorize @run
    @run.destroy
    redirect_to run_path, status: :see_other
  end

  def run_params
    params.require(:list_run).permit(:user_id, :date, :time, :location, :pace, :private)
  end
end
