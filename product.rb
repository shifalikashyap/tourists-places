class Product
  # attr_reader :price, :color, :weight
  # attr_writer :price, :color, :weight
  attr_accessor :price , :color, :weight
  def initialize(price, color, weight)
     @price = price
     @color = color
     @weight = weight
   end 

  # def price #getter method
  #   @price
  # end

  # def price=(price) #setter method
  #   @price = price 
  # end

  # def color #getter method
  #   @color
  # end

  # def weight #setter method
  #   @weight
  # end

end


p1 = Product.new('15','Red', '14kg')
# p1.weight
# p1.price
# p1.color


p1.price = "20"

puts p1.price
puts p1.color
puts p1.weight




#getter_Setter method


#getter means to retrive or fetch vaue  or attr_reader
#setter means to change or update the value or attr_writer
#both method always used in inside the class otherwise it shows nomethoderror
#attr_accessor method is for both reader or writer

