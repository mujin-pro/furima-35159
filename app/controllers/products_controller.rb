class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  def index
    @product = Product.all.order(created_at: :desc)
  end

  def show
    @product = Product.find(params[:id])
  end

  private

  def product_params
    params.require(:product).permit(
      :image, :name, :description,
      :category_id, :status_id,
      :charge_id, :source_id,
      :day_id, :price
    ).merge(user_id: current_user.id)
  end
end
