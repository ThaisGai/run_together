class RunsController < ApplicationController
  skip_after_action :verify_authorized, only: [:my_runs, :participating]
  skip_after_action :verify_policy_scoped, only: [:my_runs, :participating]

  def index
    @runs = policy_scope(Run).where.not(user: current_user).upcoming.visible_to(current_user)

    # Filtros
    @runs = @runs.where(women_only: true) if params[:filter] == "women"
    @runs = @runs.where(women_only: false) if params[:filter] == "mixed"
    @runs = @runs.where("max_participants <= ?", 5) if params[:size] == "small"
    @runs = @runs.where("max_participants > ?", 5) if params[:size] == "big"

    # Search
    @runs = @runs.where("location ILIKE ?", "%#{params[:query]}%") if params[:query].present?

    # Participando
  if params[:participating] == "true"
    joined_run_ids = current_user.run_members.pluck(:run_id)
    @runs = @runs.where(id: joined_run_ids)
  end

    # Data
    @runs = @runs.where(date: params[:date]) if params[:date].present?

    @runs = @runs.includes(:members, :user)

    @markers = @runs.map do |run|
      {
        id: run.id,
        lat: run.latitude,
        lng: run.longitude,
        name: run.user.name,
        date: run.date.strftime("%d/%m/%Y"),
        time: run.time.strftime("%H:%M"),
        pace: run.pace,
        women_only: run.women_only
      }
    end

    # Filtra corridas lotadas e pagina
    @runs = @runs.select { |run| run.members.count + 1 <= run.max_participants }
    @per_page = 6
    @page = params[:page].to_i
    @total = @runs.count
    @showing = @per_page * (@page + 1)
    @has_more = @total > @showing
    @runs = @runs.first(@showing)
  end

  def my_runs
    @runs = policy_scope(Run).where(user: current_user).includes(:members)
  end

  def participating
    @runs = Run.joins(:run_members).where(run_members: { user_id: current_user.id }).includes(:members, :user)
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
    params.require(:run).permit(:user_id, :date, :time, :location, :pace, :private, :latitude, :longitude, :women_only, :max_participants, :title)
  end
end
