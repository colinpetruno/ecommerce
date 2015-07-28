class StripeCustomer < ActiveRecord::Base
  before_create :create_stripe_id

  def self.find_or_create_by(email)
    customer = where(email: email).first_or_create
    customer
  end

  def stripe_object
    if stripe_id.present?
      Stripe::Customer.retrieve(stripe_id)
    else
      create_stripe_id
    end
  end

  private

  def create_stripe_id
    customer = Stripe::Customer.create(
      email: self.email
    )
    update_column(:stripe_id, customer.id)
    customer
  end
end
