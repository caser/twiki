class UpgradeController < ApplicationController
  def show
    @user = current_user
  end

  def create
    @user = current_user
    Stripe.api_key = Rails.configuration.stripe[:secret_key]

    # Get the credit card details submitted by the form
    if token = params[:stripeToken]
      # Add conditional for valid payment info
      customer = Stripe::Customer.create(
        :card => token,
        :plan => "premium",
        :email => @user.email
      )

      @user.customer_id = customer
      @user.account_type = "premium"
      @user.save
      redirect_to @user, message: "Account successfully upgraded. You are now a premium user - thanks for using Twiki!"
    else
      flash[:error] = "Payment information not valid. Please try again with valid information."
      render :show
    end
  end
end
