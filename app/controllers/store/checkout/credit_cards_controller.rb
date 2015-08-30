class Store::Checkout::CreditCardsController < Store::BaseController
  def new
    @credit_card = CreditCard.new
  end

  def create
    @credit_card = current_order.build_funding_instrument(credit_card_params)

    if current_order.save
      redirect_to new_checkout_order_confirmation_path
    else
      render :new
    end
  end


  def charge_a_card_example
    # Create the charge on Stripe's servers - this will charge the user's card
    begin
      charge = Stripe::Charge.create(
        amount: 1000, # amount in cents, again
        currency: "usd",
        source: @credit_card.token,
        description: "Example charge"
      )
      charge
    rescue Stripe::CardError => e
      # The card has been declined
      e
    end
  end

  private

  def credit_card_params
    params.
      require(:credit_card).
      permit(:token).
      merge(
        user_id: current_user.try(:id),
        type: "CreditCard"
      )
  end
end
