# Handle password resets
class PasswordResetsController < ApplicationController
  def create
    user = User.find_by_email(params[:email])
    if user
      user.send_password_reset
      redirect_to root_url, notice: 'Email sent with instructions'
    else
      render 'new'
      flash[:error] = "Your email isn't in the system!"
    end
    # user.send_password_reset if user
    # redirect_to root_url, notice: "Email sent with instructions"
  end

  def edit
    @user = User.find_by_password_reset_token!(params[:id])
  end

  def update
    @user = User.find_by_password_reset_token!(params[:id])
    if @user.password_reset_sent_at < 2.hours.ago
      expired_reset
    elsif @user.update_attributes(params[:user])
      valid_reset
    else
      render :edit
    end
  end

  private

  def expired_reset
    redirect_to new_password_reset_path
    flash[:error] = 'Password reset has expired'
  end

  def valid_reset
    sign_in @user
    redirect_to root_url
    flash[:success] = 'Password has been reset.'
  end
end
