class RunMembersController < ApplicationController
  before_action :authenticate_user!
  skip_after_action :verify_authorized
  skip_after_action :verify_policy_scoped

  def create
    @run = Run.find(params[:run_id])
    unless @run.members.include?(current_user)
      @run.run_members.create!(user: current_user)
    end
    redirect_to @run, notice: "Você está participando da corrida!"
  end

  def destroy
    @run = Run.find(params[:run_id])
    member = @run.run_members.find_by(user: current_user)
    member&.destroy
    redirect_to @run, notice: "Você saiu da corrida."
  end
end
