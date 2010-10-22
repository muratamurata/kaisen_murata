class Cart
  def initialize
    @item_ids = []
  end

  def add_product(product)
    @item_ids << product.id
  end

  def items
    Product.find(@item_ids)
  end
end
