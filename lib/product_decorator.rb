
	class BasicProduct
		 def initialize(price, brand)	
		     @price = price
   		     @brand = brand
		   
  		     @description = "basic product"
		    
		 end

		#getter method
		 def price
		     return @price
		 end

		 def details
		     return @description + ": #{@price}; " + @brand
		 end
		
	end

	#decorator class

	class ProductDecorator

		 def initialize(real_product)
		   @real_product = real_product
		   @extra_price = 0
		   @description = "no extra feature"
		 end
		 
		 def price
		   return  @extra_price + @real_product.price
		 end

		 def details
		   return @description + " " + @real_product.details
		 end
	 
	end 

# an concrete decorator

	class TrailersDecorator < ProductDecorator
		 def initialize(real_product)
		   super(real_product)
		   @description = "trailers bike up for 2 kids"
		   @extra_price = 5
		 end

		 def details
		   return @description + ": #{@extra_price} + " + @real_product.details
		 end
	end 


