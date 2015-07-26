class ShippingForm
  include ActiveModel::Model

  attr_accessor(
    :address_1,
    :address_2,
    :city,
    :email,
    :first_name,
    :last_name,
    :order,
    :password,
    :state,
    :user,
    :zip
  )

  validates :address_1, presence: true
  validates :city, presence: true
  validates :email, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :state, presence: true
  validates :zip, presence: true

  def process_order(current_order)
    self.order = current_order

    if valid?
      ActiveRecord::Base.transaction do
        create_user
        self.order.create_shipping_address(shipping_address_hash)
        order.update_column(:email, email)
      end
      # TODO: Update status on orer to some different state
    else
      false
    end
  end

  private

  def shipping_address_hash
    {
      address_1: address_1,
      address_2: address_2,
      city: city,
      first_name: first_name,
      last_name: last_name,
      state: state,
      zip: zip
    }
  end

  def create_user
    return if password.blank?

    self.user = User.create(
      email: email,
      password: password,
      password_confirmation: password
    )

    order.update_column(:user_id, self.user.id)
  end
end
