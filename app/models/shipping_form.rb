class ShippingForm
  include ActiveModel::Model

  attr_accessor(
    :address_1,
    :address_2,
    :city,
    :email,
    :first_name,
    :last_name,
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

  def process
    if valid?
      create_user
      # create shipping address and tie it to the current order
    end
  end

  private

  def create_user
    return if password.blank?

    self.user = User.new(
      email: email,
      password: password,
      password_confirmation: password
    )
  end
end
