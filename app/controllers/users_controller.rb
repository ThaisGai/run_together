class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update]
  before_action :set_user, only: [:show]
  def show

  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user

    if @user.update(user_params)
      redirect_to user_path(@user), notice: "Perfil atualizado!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

    private

    def set_user
      @user = User.find_by(username: params[:username])
      render json: { error: "Usuário não encontrado" }, status: :not_found if @user.nil?
    end

    def user_params
      params.require(:user).permit(:bio, :instagram_url, :username)
    end
end
