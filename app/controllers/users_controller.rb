class UsersController < ApplicationController
  ATTRIBUTES = [ :name, :email, :phone_number,
                 :password_confirmation, :password ]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      ConfirmationSender.send_confirmation_to(@user)
      redirect_to new_confirmation_path
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(*ATTRIBUTES)
  end
end
