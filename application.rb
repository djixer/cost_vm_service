require 'sinatra'
require 'csv'
require './price_loader'
require './hdd_price_loader'


set :bind, '0.0.0.0'
set :port, 5678

get '/' do
    @prices = PriceLoader.prices
    @hdd_prices = HddPriceLoader.hdd_prices
    erb :index
end

get '/cost' do
  price = PriceLoader.hash_prices
  hdd = HddPriceLoader.find_by_type_and_capacity(params["hdd_type"], params["hdd_capacity"].to_i)
  cpu_cost = params["cpu"].to_i * price["cpu"]
  ram_cost = params["ram"].to_i * price["ram"]
  @cost = cpu_cost + ram_cost + hdd.price

  disks = params[:volumes]
  disks_cost = 0
  if disks
      disks.each do |disk|
          hdd_price = HddPriceLoader.find_by_type_and_capacity(disk[1]["hdd_type"], disk[1]["hdd_capacity"].to_i).price
          disks_cost += hdd_price
      end
  end
  @cost_with_volumes = @cost + disks_cost

  erb :cost
end
