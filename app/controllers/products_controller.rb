class ProductsController < ApplicationController
  def index
  	@products = Product.all
    @order = Order.new
  end

  def purchase
  	
  	@names = params[:product_name]
  	@description = params[:product_description]
  	@price = params[:product_price]
  end

  def checkout
    Rails.logger.info("printing params new new new")
    Rails.logger.info(params[:order][:name])
  	Rails.logger.info("params =#{params}")
    Rails.logger.info("user =current_user.id")
    @store = params[:order][:store]
    @date = params[:order][:date]
    @customerName = params[:order][:name]
    @contact = params[:order][:contact]
    @address = params[:order][:address]
    @pincode = params[:order][:pincode]
    @productName=params[:productName]
    @temp=params[:temp]
    @price=params[:price]
    @desc=params[:description]
    order_params = {"user_id" => @temp, "product_name" => @productName, "product_description" => @desc, "product_price" => @price, "store" => @store ,"address" => @address, "contact" => @contact, "pincode" => @pincode, "name" => @customerName, "date" => @date}
    Rails.logger.info(@temp)
    #Rails.logger.info(@token)
    Rails.logger.info("printing params")
    Rails.logger.info(order_params)
    @productId = params[:product_id]
  	@temporder = params[:order][:name]
    
    @order = Order.new(order_params)
    unless @order.save
      Rails.logger.info("printing store")
      Rails.logger.info(tag)
      unless @store
        #render "home"
        redirect_to :controller => 'products', :action => 'home', :product_name => @productName,:product_description=> @desc, :product_price => @price
      else
        redirect_to :controller => 'products', :action => 'store', :product_name => @productName,:product_description=> @desc, :product_price => @price
      end
    end
  end

  def profile
    Rails.logger.info("printing params params params params")
    tempId=params[:user_id]
    Rails.logger.info(tempId)
    @userOrders = Order.where(user_id:tempId)
    Rails.logger.info("printing params params params params shantanu")
    Rails.logger.info(params = "#{@userOrders}")

  end

  def store
    @order = Order.new
    @names = params[:product_name]
    @description = params[:product_description]
    @price = params[:product_price]
  end

  def home
    @order = Order.new
    @names = params[:product_name]
    @description = params[:product_description]
    @price = params[:product_price]
  end
end
