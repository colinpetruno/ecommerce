class FundingInstrument < ActiveRecord::Base
  belongs_to :user
  belongs_to :order

  def charge(order)
    if user.present?

    else
      charge_with_token(order)
    end
  end


  private

  def charge_with_token(order)
    begin
      Stripe::Charge.create(
        amount: order.total_in_cents,
        currency: "usd",
        source: self.token,
        description: "Example charge"
      )
    rescue Stripe::CardError => e
      # The card has been declined
      e
    end
  end
end
