require 'rails_helper'
RSpec.describe "CustomersControllers", type: :request do
  describe "get customers_path" do
    it "renders the index view" do
      FactoryBot.create_list(:customer, 10)
      get customers_path
      expect(response).to render_template(:index)
    end
  end
  describe "get customer_path" do
    it "renders the :show template" do
      customer = FactoryBot.create(:customer)
      get customer_path(id: customer.id)
      expect(response).to render_template(:show)
    end
    it "redirects to the index path if the customer id is invalid" do
      get customer_path(id: 5000) #an ID that doesn't exist
      expect(response).to redirect_to customers_path
    end
  end
describe "get new_customer_path" do
    it "renders the :new template" do
      get new_customer_path
      expect(response).to render_template(:new)
      expect(response).to have_http_status(:ok)
    end
  end
  describe "get edit_customer_path" do
    let(:customer) { FactoryBot.create(:customer) }
    it "renders the :edit template" do
      get edit_customer_path(customer)
      expect(response).to render_template(:edit)
      expect(response).to have_http_status(:ok)
    end
  end
  describe "post customers_path with valid data" do
    it "saves a new entry and redirects to the show path for the entry" do
      customer_attributes = FactoryBot.attributes_for(:customer)
      expect { post customers_path, params: {customer: customer_attributes}
    }.to change(Customer, :count)
      expect(response).to redirect_to customer_path(id: Customer.last.id)
    end
  end
  describe "post customers_path with invalid data" do
    it "does not save a new entry or redirect" do
      customer_attributes = FactoryBot.attributes_for(:customer)
      customer_attributes.delete(:first_name)
      expect { post customers_path, params: {customer: customer_attributes}
    }.to_not change(Customer, :count)
      expect(response).to render_template(:new)
    end
  end
  describe "put customer_path with valid data" do
    it "updates an entry and redirects to the show path for the customer" do
      customer = FactoryBot.create(:customer)
      # Attempt to update customer with valid data
      put customer_path(customer), params: {customer: {phone: "1234567890"}}
      customer.reload
      # Check that valid data was saved
      expect(customer.phone).to eq("1234567890")

      expect(response).to redirect_to(customer_path(customer))
      expect(response).to have_http_status(:redirect)
    end
  end
  describe "put customer_path with invalid data" do
    it "does not update the customer record or redirect" do
      # Create a customer record
      customer = FactoryBot.create(:customer)
      # Attempt to update the customer with invalid data
      put customer_path(customer.id), params: {customer: {phone: "123"}}
      customer.reload
      # Check that invalid data was not saved to record
      expect(customer.phone).not_to eq("123")
      expect(response).to render_template(:edit) 
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
  describe "delete a customer record" do
    it "deletes a customer record" do
      # Create the customer to be deleted
      customer_to_delete = FactoryBot.create(:customer)  
      # Check if the record count decreases after delete action    
      expect{delete customer_path(customer_to_delete)}.to change(Customer, :count).by(-1)
      # Check if the response redirects to the index page
      expect(response).to redirect_to(customers_path)
      expect(response).to have_http_status(:redirect)
      # Check for the flash notice
      expect(flash[:notice]).to eq("Customer was successfully destroyed.")
    
    end 
  end
end
