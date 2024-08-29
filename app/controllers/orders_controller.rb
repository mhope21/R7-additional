class OrdersController < ApplicationController

  before_action :set_order, only: [:show, :edit, :update, :destroy]
  def index
    @orders = Order.all
    
  end

  def show
  end

  def new
    @order = Order.new
    @customers = Customer.all
  end

  def edit
    @customers = Customer.all
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      redirect_to @order, notice: 'Order was successfully created.'
    else
      flash.now[:notice] = @order.errors.full_messages.to_sentence
      @customers = Customer.all
      render :new, status: :unprocessable_entity
    end
    
  end

  def update
    if @order.update(order_params)
      flash.notice = "The order was updated successfully."
      redirect_to @order
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
  
      # @order = Order.find(params[:id])
      @order.destroy
      redirect_to orders_path, notice: 'Order was successfully destroyed.'
    
  end
  

  private

  def set_order
    @order = Order.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to orders_path, alert: "Order not found."
  end

  def order_params
    params.require(:order).permit(:product_name, :product_count, :customer_id)
  end
end
