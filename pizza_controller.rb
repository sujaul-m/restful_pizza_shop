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
  @order = PizzaOrder.find(params["id"])
  erb(:edit)
end

#DELETE ROUTE - above update route as /delete wont be found after dynamic id if this is put under update
post "/pizza-orders/:id/delete" do
  @order = PizzaOrder.find(params["id"])
  @order.delete()
  redirect "/pizza-orders"

end

#UPDATE ROUTE
post "/pizza-orders/:id" do
  @order = PizzaOrder.new(params)
  @order.update()
  erb(:update)
end


#SHOW ROUTE
get "/pizza-orders/:id" do
  @order = PizzaOrder.find(params["id"])
  erb(:show)
end
