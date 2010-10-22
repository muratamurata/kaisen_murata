class Cartitem
  attr_reader :product_id,:quantity
  
  def initialize(product)
    @product_id = product.id
    @quantity = 1 
  end

  def increment_quantity
    @quantity += 1
  end

  def name
    product.name
  end

  def price
    product.price * quantity
  end

  private
  def product
    Product.find(@product_id)
  end
end

class Cart
  def add_product(product)
    current_item = items.find{|item| item.product_id == product.id}
    if current_item
      current_item.increment_quantity
    else
      items << Cartitem.new(product)
    end
  end

  def total_price
    @item.map (&:price).sum
  end

  def items
    @item ||= []
  end
end
