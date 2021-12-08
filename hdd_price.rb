class HddPrice
	attr_accessor :type, :capacity, :price

	def initialize(type, capacity, price)
		@type = type
		@capacity = capacity
		@price = price
	end
end