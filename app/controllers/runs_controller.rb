class RunsController < ApplicationController
  skip_after_action :verify_authorized, only: :my_runs
  skip_after_action :verify_policy_scoped, only: :my_runs

  def index
    @runs = policy_scope(Run).where.not(user: current_user)

    @markers = @runs.map do |run| {
        lat: run.latitude,
        lng: run.longitude
      }
    end
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
    params.require(:run).permit(:user_id, :date, :time, :location, :pace, :private, :latitude, :longitude)
  end
end
