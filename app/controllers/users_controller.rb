class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update]
  before_action :set_user, only: [:show]
  after_action :verify_authorized

  def show
    authorize @user
  end

  def edit
    @user = current_user
    authorize @user
  end

  def update
    @user = current_user
    authorize @user
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "Perfil atualizado!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = User.find_by!(username: params[:username])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path, alert: "Usuário não encontrado."
  end

  def user_params
    params.require(:user).permit(:bio, :instagram_url, :username)
  end
end
