class Api::V1::UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]

  def show
    render json: @current_user, status: :ok
  end
end
