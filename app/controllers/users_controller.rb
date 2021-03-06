class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find_by params[:id]
    if @user.nil?
      flash[:danger] = t "controllers.users.m_nil"
      redirect_to root_path
    end
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = t "controllers.users.m_success"
      redirect_to @user
    else
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit :name, :email, :password, :password_confirmation
  end
end
