Given /^I am on the puppy adoption site$/ do
  visit(HomePage)
end

When /^I click the View Details button for "(.*?)"$/ do |name|
  on(HomePage).select_puppy name
end

And /^I click the Adopt Me button$/ do
  on(DetailsPage).add_to_cart
end

And /^I click the Complete the Adoption button$/ do
  on(ShoppingCartPage).proceed_to_checkout
end

And /^I enter "(.*?)" in the name field$/ do |name|
  on(CheckoutPage).name = name
end

And /^I enter "(.*?)" in the address field$/ do |address|
  on(CheckoutPage).address = address
end

And /^I enter "(.*?)" in the email field$/ do |email|
  on(CheckoutPage).email = email
end

And /^I select "(.*?)" from the pay with dropdown$/ do |payment_method|
  on(CheckoutPage).payment_method = payment_method
end

And /^I click the Place Order button$/ do
  on(CheckoutPage).place_order
end

Then /^I should see "(.*?)"$/ do |notice|
  @current_page.should have_notice notice
end

And /^I click the Adopt Another Puppy button$/ do
  on(ShoppingCartPage).continue_shopping
end

Then /^I should see "(.*?)" as the name for line item (\d+)$/ do |name, line_item|
  on(ShoppingCartPage).name_for_line_item(line_item).should include name
end

And /^I should see "(.*?)" as the subtotal for line item (\d+)$/ do |subtotal, line_item|
  on(ShoppingCartPage).subtotal_for_line_item(line_item.to_i).should == subtotal
end

And /^I should see "(.*?)" as the cart total$/ do |total|
  on(ShoppingCartPage).cart_total.should == total
end

When /^I complete the adoption of a puppy$/ do
  navigate_all
end

When /^I complete the adoption using a Credit card$/ do
  on(CheckoutPage).checkout('payment_method' => 'Credit card')
end

When /^I complete the adoption$/ do
  on(CheckoutPage).checkout
end

When /^I checkout leaving the name field blank/ do
  navigate_to(CheckoutPage).checkout('name' => '')
end

Then /^I should see the error message "([^"]*)"$/ do |msg|
  @current_page.should have_error_message msg
end
