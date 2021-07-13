class LiquidationsController < ApplicationController
  before_action :find_product, only: [:index, :create]

  def index
    @liquidation_address = LiquidationAddress.new
  end

  def create
    @liquidation_address = LiquidationAddress.new(liquidation_params)
    if @liquidation_address.valid?
      @liquidation_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def liquidation_params
    params.require(:liquidation_address).permit(:postal_code, :source_id, :city, :block, :building_name, :phone_number).merge(user_id: current_user.id, product_id: params[:product_id])
  end

  def find_product
    @product = Product.find(params[:product_id])
  end
end
