class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  
  def new
    @product = Product.new
  end

  def create
    @product = Product.create(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  def index
    @product = Product.all.order(created_at: :desc)
  end

  private

  def product_params
    params.require(:product).permit(
      :image, :name, :product_description,
      :product_category_id, :product_status_id,
      :delivery_charge_id, :delivery_source_id,
      :days_up_to_delivery_id, :price
    ).merge(user_id: current_user.id)
  end
end
