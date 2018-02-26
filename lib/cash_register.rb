class CashRegister
  attr_accessor :total, :discount

  def initialize(discount=nil)
    @prices=[]
    @items=[]
    @total=0
    @discount = discount if discount != nil
  end

  def add_item(title,price,quant=1)
    @prices << price
    quant.times {@items << title}
    @quant = quant
    @total += (price*quant)
  end

  def apply_discount
    if discount!=nil
      @total -= @total*(@discount/100.0)
      return "After the discount, the total comes to $#{@total.to_i}."
    else
      return "There is no discount to apply."
    end
  end

  def items
    @items
  end

  def void_last_transaction
    @items.pop
    @total -= @prices.pop
  end
end
