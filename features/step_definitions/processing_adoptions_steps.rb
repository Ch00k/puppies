Given /^I have a pending adoption for "(.*?)"$/ do |name|
  #visit(HomePage)
  #navigate_to(CheckoutPage).checkout('name' => name)
  order = build(:order, :name => name)
  create(:adoption, :order => order)
end

When /^I process that adoption$/ do
  visit(AdminLandingPage)
  on(AdminLoginPage).do_login
  on(AdminLandingPage).adoptions
  on(AdoptionsPage).process_first_puppy
end

Then /^I should see "(.*?)" $/ do |msg|
  @current_page.should have_notice msg
end