class Product
  def initialize(price, color, weight)
     @price = price
     @color = color
     @weight = weight
   end 

  def price
    puts @price
  end

  def color
    puts @color
  end

  def weight
    puts @weight
  end

end


p1 = Product.new('15','Red', '14kg')
p1.weight
p1.price
p1.color
