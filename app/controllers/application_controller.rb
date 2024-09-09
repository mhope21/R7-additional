class ApplicationController < ActionController::Base
  before_action :set_customers_and_orders

  private

  def set_customers_and_orders
    @customers = Customer.all
    @orders = Order.all
  end
end
