class Api::V1::PackagesController < ApplicationController
  before_action :authenticate_user_by_token, unless: :index?
  before_action :set_package, only: %i[show update destroy]

  def index
    packages = Package.all
    render json: { message: 'All the packages', packages: }, status: :ok
  end

  def show
    render json: @package, status: :ok
  end

  def create
    package = Package.new(package_params.merge(author_id: @current_user.id))
    if package.save
      render json: { message: 'Workspace created successfully', package: }, status: :created
    else
      render json: { errors: package.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @package.update(package_params)
      render json: @package, status: :ok
    else
      render json: { errors: @package.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    if @package.author_id == @current_user.id
      @package.destroy
      render json: { message: 'Package workspace deleted successfully' }, status: :ok
    else
      render json: { errors: "The user doesn't have the right to delete the package" }, status: :forbidden
    end
  end

  private

  def set_package
    @package = Package.find(params[:id])
  end

  def package_params
    params.require(:package).permit(:name, :description, :price, :author_id, :image_url)
  end

  def index?
    action_name == 'index'
  end
end
