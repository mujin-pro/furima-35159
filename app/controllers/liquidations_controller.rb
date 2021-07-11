class LiquidationsController < ApplicationController

  def index
    
  end

  private

  def liquidation_params
    params.require(:liquidation).permit.merge(product_id: params[:product_id])
  end
end
