class Api::V1::RegistrationsController < ApplicationController
  def create
    if email_already_exists(reg_params[:email])
      render json: { error: 'Email already being used' }, status: :unprocessable_entity
    else
      user = User.new(reg_params)
      if user.save
        render json: { message: 'User created successfully', user: }, status: :ok
      else
        render json: { error: 'Something went wrong when creating a new user' }, status: :unprocessable_entity
      end
    end
  end

  protected

  def reg_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def email_already_exists(email)
    User.exists?(email:)
  end
end
