class Customer < ApplicationRecord
  has_many :orders

  validates :first_name, presence: true, format: { with: /\A[a-z\-' ]+\z/i }
  validates :last_name, presence: true, format: { with: /\A[a-z\-' ]+\z/i }
  validates :phone, presence: true
  validates :phone, format: { with: /\A\d+\z/, message: "should only contain digits" }
  validates :phone, length: { is: 10 }
  validates :email, presence: true, email: true

  

  def full_name
    "#{first_name} #{last_name}"
  end

  def formatted_phone
    return phone unless phone.present?
      digits = phone
    # Format the digits with dashes
      formatted_number = digits.insert(6, '-').insert(3, '-')
      formatted_number
    
  end
end
