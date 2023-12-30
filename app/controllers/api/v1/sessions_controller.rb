class Api::V1::SessionsController < ApplicationController
  respond_to :json

  def create
    user = User.find_by(email: params[:user][:email])
    if user&.authenticate(params[:user][:password])
      token = encode_token(user)
      render json: {
        message: 'User is logged in',
        user:,
        token:
      }, status: :ok
    else
      render json: { error: 'Invalid credentials' }, status: :unauthorized
    end
  end

  private

  def encode_token(user)
    payload = { user_id: user.id, exp: 24.hours.from_now.to_i }
    JWT.encode(payload, 'thesecretkeywhichwillbechangedlaterwithrandomlygeneratedkey', 'HS256')
  end
end
