require 'rails_helper'

RSpec.describe "OrdersControllers", type: :request do
  describe "get orders_path" do
    it "renders the index view" do
      FactoryBot.create_list(:order, 10)
      get orders_path
      expect(response).to render_template(:index)
    end
  end
  describe "get order_path" do
    it "renders the :show template" do
      order = FactoryBot.create(:order)
      get order_path(id: order.id)
      expect(response).to render_template(:show)
    end
    it "redirects to the order_path if the order id is invalid" do
      get order_path(id: 5000) #an ID that doesn't exist
      expect(response).to redirect_to orders_path
    end
  end
  describe "get new_order_path" do
    it "renders the :new template" do
      get new_order_path
      expect(response).to render_template(:new)
      expect(response).to have_http_status(:ok)
    end
  end
  describe "get edit_order_path" do
    let(:order) { FactoryBot.create(:order) }
    it "renders the :edit template" do
      get edit_order_path(order)
      expect(response).to render_template(:edit)
      expect(response).to have_http_status(:ok)
    end
  end
  describe "post orders_path with valid data" do
    it "saves a new entry and redirects to the show path for the entry" do
      customer = FactoryBot.create(:customer)
      order_attributes = FactoryBot.attributes_for(:order).merge(customer_id: customer.id)
      # puts order_attributes.inspect
      expect { post orders_path, params: {order: order_attributes}
    }.to change(Order, :count)
      expect(response).to redirect_to order_path(id: Order.last.id)
    end
  end
  describe "post orders_path with invalid data" do
    it "does not save a new entry or redirect" do
      order_attributes = FactoryBot.attributes_for(:order).merge(customer_id: nil)
      expect { post orders_path, params: {order: order_attributes}
    }.to_not change(Order, :count)
      expect(response).to render_template(:new)
    end
  end
  describe "put order_path with valid data" do
    let(:order) { FactoryBot.create(:order) }
    it "updates an entry and redirects to the show path for the customer" do
      # Attempt to update customer with valid data
      put order_path(order), params: {order: {product_name: "Paintbrush set"}}
      order.reload
      # Check that valid data was saved
      expect(order.product_name).to eq("Paintbrush set")

      expect(response).to redirect_to(order_path(order))
      expect(response).to have_http_status(:redirect)
    end
  end
  describe "delete an order record" do
    it "deletes an order record" do
      # Create the order to be deleted
      order_to_delete = FactoryBot.create(:order)
      puts order_to_delete.inspect  
      # Check if the record count decreases after delete action    
      expect{delete order_path(order_to_delete)}.to change(Order, :count).by(-1)
      # Check if the response redirects to the order page
      expect(response).to redirect_to(orders_path)
      expect(response).to have_http_status(:redirect)
      # Check for the flash notice
      expect(flash[:notice]).to eq("Order was successfully destroyed.")
    
    end 
  end
end
