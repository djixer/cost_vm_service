require './hdd_price'

class HddPriceLoader

    def self.hdd_prices
        @data = []
        CSV.foreach("./hdd_price.csv") do |row|
            @data << HddPrice.new(row[0], row[1].to_i, row[2].to_i)
        end
        @data
    end

    def self.find_by_type_and_capacity(type, capacity)
            hdd_prices.find { |hdd_price| hdd_price.type == type && hdd_price.capacity == capacity }
    end

end
