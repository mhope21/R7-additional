require 'rails_helper'

RSpec.describe Order, type: :model do
  let(:customer) { Customer.create(first_name: "Joe", last_name: "Blow") }

  subject { Order.new(product_name: "Sudoku Puzzle Book", product_count: 4, customer: customer) }
  
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end
  it "is not valid without a product_name" do
    subject.product_name=nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a product_count" do
    subject.product_count=nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a customer" do
    subject.customer=nil
    expect(subject).to_not be_valid
  end
end
