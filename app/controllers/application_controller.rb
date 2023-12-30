class ApplicationController < ActionController::API
  # skip_before_action :verify_authenticity_token
  # # before_action :current_user
  # before_action :authenticate_token
  # protected

  def authenticate_token
    token = request.headers['Authorization']&.split&.last
    puts '************'
    puts token
    puts '***************'

    unless token
      render json: { error: 'Unauthorized: Token missing' }, status: :unauthorized
      return
    end

    begin
      decoded_token = decode_token(token)

      puts '@@@@@@@@@@@@@@'
      puts decoded_token
      puts '@@@@@@@@@@@@@@@@@@'
      user_id = decoded_token.first['user_id']
      @current_user = User.find_by(id: user_id)

      render json: { error: 'Unauthorized: User not found' }, status: :unauthorized unless @current_user
    rescue JWT::DecodeError => e
      render json: { error: "Unauthorized: #{e.message}" }, status: :unauthorized
    end
  end

  def decode_token(token)
    JWT.decode(token, 'thesecretkeywhichwillbechangedlaterwithrandomlygeneratedkey', true, algorithm: 'HS256')
  end
end
