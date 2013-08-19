require '../dvc-sinatra.rb'

get "/" do
  halt erb(:main)
end

get "/place_order" do
  @dishes = Dish.order(:id).all
  halt erb(:place_order)
end

post "/place_order" do
  if params[:commit] == "Place order"
  	order = Order.new 
    order.table_number = params[:table_number]
    order.total_price = 0.0
    order.save

    Dish.all.each do |dish|
      if params["quantity_for_dish_#{dish.id}"] != ""
        line_item = LineItem.new
        line_item.dish_id = dish.id
        line_item.order_id = order.id
        line_item.line_price = dish.price * quantity.to_i
        line_item.quantity = params["quantity_for_dish_#{dish.id}"]
        line_item.save!

        order.total_price = order.total_price + line_item.line_price
      end

    order.save!
    end
  end

  redirect "/"
end

get "/orders" do
  @orders = Order.order(:id).all
  halt erb(:orders)
end

get "/dishes" do
  @dishes = Dish.order(:id).all
  halt erb(:dishes)
end