require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )

require_relative("./models/pizza_order")
also_reload("./models/*")

#INDEX ROUTE
get "/pizza-orders" do
  @orders = PizzaOrder.all()
  erb(:index)
end

#NEW ROUTE - a static part of the url has to be above anything dynamic
get "/pizza-orders/new" do
  erb(:new)
end

#CREATE ROUTE
post "/pizza-orders" do
  @order = PizzaOrder.new(params)
  @order.save()
  erb(:create)
end

#EDIT ROUTE
get "/pizza-orders/:id/edit" do
  erb(:edit)
end

#SHOW ROUTE
get "/pizza-orders/:id" do
  @order = PizzaOrder.find(params["id"])
  erb(:show)
end
