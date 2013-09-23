class AdminController < ApplicationController
	def index 
  	render :main and return 
	end

	def login
		render :login and return
	end

	def login_post
		admin = Admin.where(username: params[:username]).first

		if params[:username] = admin 
			if admin.authenticate(params:[:password]) != false
				redirect_to "/main"
			else
				flash[:error] = "Wrong password"
				render :login and return
			end
		else
			flash[:error] = "Wrong username"
			render :login and return
		end
	end

	def orders
	  @orders = Order.order(:id).all
	  render :orders and return
	end

	def dishes
	  @dishes = Dish.order(:id).all
	  render :dishes and return
	end
end
