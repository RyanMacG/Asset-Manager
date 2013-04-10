class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:index, :edit, :update]
  before_filter :correct_user,   only: [:edit, :update]
  before_filter :admin_user,     only: :destroy

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      UserMailer.delay.signup_confirmation(@user)
      sign_in @user
      flash[:success] = "Welcome to the JTC Asset Manager"
      redirect_to @user
    else
      render 'new'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "Target Annihilated! Pew Pew"
    redirect_to users_path
  end

  def show
    @user = User.find(params[:id])
    @asset = @user.assets.paginate(page: params[:page])
  end

  def edit
  end

  def update
    if @user.update_attributes(params[:user])
      sign_in @user
      redirect_to @user, notice: "Profile updated"
    else
      render 'edit'
    end
  end

  def index
    @users = User.paginate(page: params[:page])
  end

  def import
    User.import(params[:file])
    redirect_to users_path
    flash[:success] = "Users imported"
  end

  private

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user) || current_user.admin?
    end

    #No pew pew for plebs
    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end
end
