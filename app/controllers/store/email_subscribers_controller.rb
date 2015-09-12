class Store::EmailSubscribersController < Store::BaseController
  def create
    @subscriber = EmailSubscriber.
      create(email: email_subscriber_params[:email])

    sign_in(@subscriber.user)

    respond_to do |format|
      format.js
    end
  end

  private

  def email_subscriber_params
    params.require(:email_subscriber).permit(:email)
  end
end
