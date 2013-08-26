require '../dvc-sinatra.rb'

get "/" do 
	@tables = Table.all 
	redirect "/main"
end

get "/main" do 
	@tables = Table.all 
	@orders = Order.all 
	halt erb(:main)
end

post "/main" do 
	@tables = Table.all
	@orders = Order.all

	Table.all.each do |table|
		if params[:commit] == "Occupy table #{table.id}" 
			new_order = Order.new
			new_order.table_id = table.id
			new_order.is_paid = false
			new_order.total_price = 0.0
			new_order.save!
		end
	end
	redirect "/main"
end

get "/order/:id" do
	@order = Order.find(params[:id])
	@entrees = Entree.all
	halt erb(:order)
end

post "/order/:id" do
	@order = Order.find(params[:id])
	@entrees = Entree.all
	@chair_number = params[:chair_number]
	@table = Table.where(id: @order.table_id).first

	if params[:commit] == "Add Entree"
		if params[:entree_id] != nil 
			new_order_line = OrderLine.new
			new_order_line.order_id = @order.id
			new_order_line.entree_id = params[:entree_id]
			if params["chair_number"] == ""
				flash.now[:error] = "Please enter a chair number"
			elsif params["chair_number"].to_i > @table.number_of_chairs
				flash.now[:error] = "That chair number is invalid"
			elsif params["chair_number"].to_i < 0.0
				flash.now[:error] = "That chair number is invalid"
			else					
				new_order_line.chair_number = @chair_number
			end

			new_order_line.save!
		end
		
		entree = Entree.find(params[:entree_id])
		@order.total_price = @order.total_price + entree.price
		@order.save!

		redirect "/order/#{@order.id}"

	elsif params[:commit] == "Pay and Close"
		@order.is_paid = true
		@order.save!
		redirect "/main"
	end
end