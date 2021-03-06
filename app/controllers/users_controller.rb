class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :redirect_login, only: [:new, :create]


  def index
    @users = User.paginate(page: params[:page], per_page: 25)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Account successfully created."
      redirect_to @user
    else
      @errors = @user.errors.full_messages
      flash.now[:danger] = "There was an issue creating your account"
      render 'new'
    end
  end

  def show
    @categories = @user.categories
  end

  def edit
  end

  def update
    @user.update_attributes(user_params)
    if @user.save
      flash[:success] = "Account successfully updated."
      redirect_to @user
    else
      flash.now[:danger] = "Account update failed:"
      @errors = @user.errors.full_messages
      render 'users/edit'
    end
  end

  def destroy
    @user.destroy
    session[:user_id] = nil
    @current_user = nil
    flash[:success] = "Account has been deleted."
    redirect_to root_path
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email,
                                 :password, :password_confirmation)
  end
end
