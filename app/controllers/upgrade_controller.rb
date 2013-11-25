class UpgradeController < ApplicationController
  def show
    @user = current_user
  end

  def update
    @user = current_user
    @payment = params[:payment]
    # Add conditional for valid payment info
    if payment_valid?(@payment)
      charge_card(@payment)
      puts @user.inspect
      @user.account_type = "premium"
      @user.save
      redirect_to @user, message: "Account successfully upgraded. You are now a premium user - thanks for using Twiki!"
    else
      flash[:error] = "Payment information not valid. Please try again with valid information."
      render :show
    end
  end

  protected

  def payment_valid?(payment)
    # TODO - implement proper validation
    if payment.length != 0
      true
    else
      false
    end
  end

  def charge_card(payment)
    # TODO - implement functionality to charge the credit card. Perhaps this happens offsite?
  end
end
