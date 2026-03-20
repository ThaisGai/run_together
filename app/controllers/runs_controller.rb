class RunsController < ApplicationController

  def index
    @runs = policy_scope(Run)
  end

  def my_runs
    @runs = policy_scope(Run).where(user: current_user)
  end

  def show
    @run = Run.find(params[:id])
    authorize @run
  end

  def new
    @run = Run.new
    authorize @run
  end

  def create
    @run = Run.new(run_params)
    @run.user = current_user
    authorize @run
    if @run.save
      redirect_to @run
    else
      render "new", status: :unprocessable_entity
    end
  end

  def edit
    @run = Run.find(params[:id])
    authorize @run
  end

  def update
    @run = Run.find(params[:id])
    authorize @run
    if @run.update(run_params)
      redirect_to runs_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @run = Run.find(params[:id])
    authorize @run
    @run.destroy
    redirect_to runs_path, status: :see_other
  end

  private

  def run_params
    params.require(:run).permit(:user_id, :date, :time, :location, :pace, :private)
  end
end
