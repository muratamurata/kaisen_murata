class Cart
  def add_product(product)
    @item_ids << product.id
  end

  def items
   #Product.find(@item_ids)
   item_ids.map{|id| Product.find(id)}
  end

  def item_ids
    @item_ids ||= []
  end
end
