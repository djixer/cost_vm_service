require './price'

class PriceLoader

    def self.prices
        @prices = []
        CSV.foreach("./prices.csv") do |row|
            @prices << Price.new(row[0], row[1].to_i)
        end
        @prices
    end

    def self.hash_prices
        @hash_prices = {}
        prices.each do |el|
            @hash_prices[el.type] = el.price
        end
        @hash_prices
    end

    def self.find_by_type(type)
        prices.find { |price| price.type == type }
    end

end
