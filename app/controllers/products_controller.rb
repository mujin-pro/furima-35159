class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_product, only: [:show, :edit]

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
  end

  def edit
    redirect_to root_path if current_user != @product.user
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params) && current_user == @product.user
      redirect_to product_path
    else
      render :edit
    end
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

  def find_product
    @product = Product.find(params[:id])
  end
end
