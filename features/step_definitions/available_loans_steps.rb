Given(/^I have navigated to the Loans Web App$/) do
  visit(Home_Page)
end

When(/^I provide the following information to get the available loan plans for me$/) do |table|
  amount = table.hashes.first['amount']
  reason = table.hashes.first['reason']
  dni = table.hashes.first['dni']
  on(Home_Page).enter_values(amount, reason, dni)
end

Then(/^the following plans should be displayed$/) do |plans|
  on(Available_Plans_Page).get_available_plans.should have_the_same_items_as plans.hashes
end

And(/^I choose option N° "([^"]*)"$/) do |plan_number|
  on(Available_Plans_Page).choose_plan(plan_number)
end

And(/^she asks for a S\/\."([^"]*)" loan$/) do |amount|
  on(Home_Page).enter_values(amount, purpose, @user.dni)
end

Given(/^"([^"]*)" has navigated to the Loans Web App$/) do |userFirstName|
  visit(Home_Page)
  @user = getUser(userFirstName)
end