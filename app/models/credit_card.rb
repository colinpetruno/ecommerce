class CreditCard < FundingInstrument
  before_create :redeem_token
  belongs_to :user

  private

  def redeem_token
    if user.present?
      customer = user.stripe_customer
      card = customer.sources.create({source: token})

      self.stripe_id = card.id
      self.description = card.brand
      self.number = card.last4
      self.expiration_month = card.exp_month
      self.expiration_year = card.exp_year
      self
    end
  end

  def details
    @credit_card ||= fetch_credit_card
  end

  def fetch_credit_card
    customer = user.stripe_customer
    customer.sources.retrieve(stripe_id)
  end
end
