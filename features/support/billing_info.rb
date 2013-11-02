module EnterBillingInfoSteps
  def enter_billing_info(address, ccn, city, state, country, zip)
    visit(upgrade_path)
    fill_in("Address", :with => address)
    fill_in("Credit card number", :with => ccn)
    fill_in("City", :with => city)
    fill_in("State", :with => state)
    fill_in("Country", :with => country)
    fill_in("Zip", :with => zip)
  end
end
