class LiquidationsController < ApplicationController
  before_action :find_product, only: [:index, :create]
  before_action :user_judge, only: [:index, :create]
  before_action :product_judge, only: [:index, :create]
  before_action :authenticate_user!, only: [:index, :create]

  def index
    @liquidation_address = LiquidationAddress.new
  end

  def create
    @liquidation_address = LiquidationAddress.new(liquidation_params)
    if @liquidation_address.valid?
      pay_product
      @liquidation_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def liquidation_params
    params.require(:liquidation_address).permit(:postal_code, :source_id, :city, :block, :building_name, :phone_number).merge(
      user_id: current_user.id, product_id: params[:product_id], token: params[:token]
    )
  end

  def find_product
    @product = Product.find(params[:product_id])
  end

  def pay_product
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @product.price,
      card: liquidation_params[:token],
      currency: 'jpy'
    )
  end

  def user_judge
    redirect_to root_path if current_user == @product.user
  end

  def product_judge
    redirect_to root_path if @product.liquidation.present?
  end
end
