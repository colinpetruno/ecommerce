class Store::Checkout::ShippingFormsController < Store::BaseController
  def new
    @shipping_form = ShippingForm.new
  end

  def create
    @shipping_form = ShippingForm.new(shipping_form_params)

    if @shipping_form.process_order(current_order)
      if @shipping_form.user
        # migrate orders
        Order.
          where(status: :active, session_id: session.id).
          update_all(user_id: @shipping_form.user.id)

        # log user in
        sign_in(@shipping_form.user)
      end
      redirect_to new_checkout_credit_card_path#
    else
      render :new
    end
  end

  private

  def shipping_form_params
    params.
      require(:shipping_form).
      permit(
        :first_name,
        :last_name,
        :email,
        :address_1,
        :address_2,
        :city,
        :state,
        :zip,
        :password
      )
  end
end
