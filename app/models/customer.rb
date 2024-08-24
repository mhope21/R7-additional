class Customer < ApplicationRecord
  has_many :orders

  validates :first_name, presence: true, format: { with: /\A[a-z\-' ]+\z/i }
  validates :last_name, presence: true, format: { with: /\A[a-z\-' ]+\z/i }
  validates :phone, presence: true
  validates :phone, numericality: { only_integer: true }
  validates :phone, length: { is: 10 }
  validates :email, presence: true, email: true

  

  def full_name
    "#{first_name} #{last_name}"
  end

  def formatted_phone
    return phone unless phone.present?

    # Ensure the phone number is only digits
    digits = phone.gsub(/\D/, '')

    # Format the digits with dashes
    if digits.length == 10
      formatted_number = digits.insert(6, '-').insert(3, '-')
      formatted_number
    else
      phone # Return the original if it's not 10 digits
    end
  end
end
