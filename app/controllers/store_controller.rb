class StoreController < ApplicationController
  def index
	@products = Product.for_sale.for_sale.paginate :page => params[:page], :per_page => 5
  end

end
